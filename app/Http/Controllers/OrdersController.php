<?php

namespace App\Http\Controllers;

use App\Events\OrderReviewed;
use App\Exceptions\InvalidRequestException;
use App\Http\Requests\ApplyRefundRequest;
use App\Http\Requests\CrowdFundingOrderRequest;
use App\Http\Requests\OrderRequest;
use App\Http\Requests\SendReviewRequest;
use App\Jobs\CloseOrder;
use App\Models\CartItem;
use App\Models\Order;
use App\Models\ProductSku;
use App\Models\User;
use App\Models\UserAddress;
use App\Services\CartService;
use App\Services\OrderService;
use Carbon\Carbon;
use Illuminate\Auth\AuthManager;
use Illuminate\Http\Request;

class OrdersController extends Controller
{
    public function index(Request $request)
    {
        $orders = Order::query()
            ->with(['items.product', 'items.productSku'])
            ->where('user_id', User::info()->id)
            ->orderBy('created_at', 'desc')
            ->paginate();

        return $this->setStatusCode(200)->success($orders);
    }

    public function show(Order $order)
    {
        $this->authorize('own', $order);
        return $this->setStatusCode(200)->success($order->load(['items.productSku', 'items.product']));
    }

    public function store(OrderRequest $request,OrderService $orderService)
    {
        $user  = $request->user();
        $address = UserAddress::find($request->input('address_id'));
        return $orderService->store($user, $address, $request->input('remark'), $request->input('items'));
    }

    public function received(Order $order)
    {
        // 校验权限
        $this->authorize('own', $order);
        if ($order->ship_status !== Order::SHIP_STATUS_DELIVERED) {
            throw new InvalidRequestException('发货状态不正确');
        }
        $order->update(['ship_status' => Order::SHIP_STATUS_RECEIVED]);

        return $this->setStatusCode(200)->success('成功');
    }

    public function sendReview(Order $order, SendReviewRequest $request){
        $this->authorize('own', $order);
        if (!$order->paid_at) {
            throw new InvalidRequestException('该订单未支付，不可评价');
        }
        // 判断是否已经评价
        if ($order->reviewed) {
            throw new InvalidRequestException('该订单已评价，不可重复提交');
        }
        $reviews = $request->input('reviews');
        // 开启事务
        \DB::transaction(function () use ($reviews, $order) {
            foreach ($reviews as $review) {
                $orderItem = $order->items()->find($review['id']);
                // 保存评分和评价
                $orderItem->update([
                    'rating'      => $review['rating'],
                    'review'      => $review['review'],
                    'reviewed_at' => Carbon::now(),
                ]);
            }
            $order->update(['reviewed' => true]);
            event(new OrderReviewed($order));
        });
        return $this->setStatusCode(200)->success('成功');
    }

    public function applyRefund(Order $order, ApplyRefundRequest $request)
    {
        // 校验订单是否属于当前用户
        $this->authorize('own', $order);
        // 判断订单是否已付款
        if (!$order->paid_at) {
            throw new InvalidRequestException('该订单未支付，不可退款');
        }
        // 判断订单退款状态是否正确
        if ($order->refund_status !== Order::REFUND_STATUS_PENDING) {
            throw new InvalidRequestException('该订单已经申请过退款，请勿重复申请');
        }
        // 将用户输入的退款理由放到订单的 extra 字段中
        $extra                  = $order->extra ?: [];
        $extra['refund_reason'] = $request->input('reason');
        // 将订单退款状态改为已申请退款
        $order->update([
            'refund_status' => Order::REFUND_STATUS_APPLIED,
            'extra'         => $extra,
        ]);

        return $order;
    }

    public function crowdfunding(AuthManager $auth,CrowdFundingOrderRequest $request, OrderService $orderService)
    {
        $user    = $auth->guard('api')->user();
        $sku     = ProductSku::find($request->input('sku_id'));
        $address = UserAddress::find($request->input('address_id'));
        $amount  = $request->input('amount');
        return $orderService->crowdfunding($user, $address, $sku, $amount);
    }
}
