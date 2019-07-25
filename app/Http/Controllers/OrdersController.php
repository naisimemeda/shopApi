<?php

namespace App\Http\Controllers;

use App\Exceptions\InvalidRequestException;
use App\Http\Requests\OrderRequest;
use App\Jobs\CloseOrder;
use App\Models\CartItem;
use App\Models\Order;
use App\Models\ProductSku;
use App\Models\User;
use App\Models\UserAddress;
use App\Services\CartService;
use App\Services\OrderService;
use Carbon\Carbon;
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
}
