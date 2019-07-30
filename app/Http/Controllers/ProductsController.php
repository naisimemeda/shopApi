<?php

namespace App\Http\Controllers;

use App\Exceptions\InvalidRequestException;
use App\Models\Category;
use App\Models\OrderItem;
use App\Models\Product;
use App\Models\User;
use App\Services\CategoryService;
use Illuminate\Http\Request;

class ProductsController extends Controller
{
    public function index(Request $request,  CategoryService $categoryService){
        $builder = Product::query()->where('on_sale', true);
        if ($search = $request->input('search', '')){
            $like = '%'.$search.'%';
            $builder->where(function ($query) use ($like){
                $query->where('title', 'like', $like)
                    ->orWhere('description', 'like', $like)
                    ->orWhereHas('skus', function ($query) use ($like){
                        $query->where('title', 'like', $like)
                            ->orWhere('description', 'like', $like);
                    });
            });
        }
        if ($order = $request->input('order', '')) {
            // 是否是以 _asc 或者 _desc 结尾
            if (preg_match('/^(.+)_(asc|desc)$/', $order, $m)) {
                // 如果字符串的开头是这 3 个字符串之一，说明是一个合法的排序值
                if (in_array($m[1], ['price', 'sold_count', 'rating'])) {
                    // 根据传入的排序值来构造排序参数
                    $builder->orderBy($m[1], $m[2]);
                }
            }
        }
        if ($request->input('category_id') && $category = Category::find($request->input('category_id'))) {
            // 如果这是一个父类目
            if ($category->is_directory) {
                // 则筛选出该父类目下所有子类目的商品
                $builder->whereHas('category', function ($query) use ($category) {
                    $query->where('path', 'like', $category->path.$category->id.'-%');
                });
            } else {
                // 如果这不是一个父类目，则直接筛选此类目下的商品
                $builder->where('category_id', $category->id);
            }
        }
        $products = $builder->paginate(16);
        return $this->setStatusCode(201)->success([
            'products' => $products,
            'category' =>  $category->ancestors ?? null,
            'categoryTree' => $categoryService->getCategoryTree()
        ]);
    }

    public function show(Product $product, Request $request)
    {
        if (!$product->on_sale) {
            throw new InvalidRequestException('商品未上架');
        }
        $reviews = OrderItem::query()
            ->with(['order.user', 'productSku']) // 预先加载关联关系
            ->where('product_id', $product->id)
            ->whereNotNull('reviewed_at') // 筛选出已评价的
            ->orderBy('reviewed_at', 'desc') // 按评价时间倒序
            ->limit(10) // 取出 10 条
            ->get();
        if($product->type == Product::TYPE_CROWDFUNDING){
            $product = $product->with(['skus', 'crowdfunding'])->find($product->id);
        }else{
            $product = $product->with(['skus'])->find($product->id);
        }
        return $this->setStatusCode(201)->success([$product, $reviews]);
    }

    public function favor(Product $product){
        $user = User::info();
        if($user->favoriteProducts()->find($product->id)){
           return $this->setStatusCode(201)->success('成功');
        }
        $user->favoriteProducts()->attach($product);
        return $this->setStatusCode(201)->success('成功');
    }

    public function disfavor(Product $product){
        $user = User::info();
        $user->favoriteProducts()->detach($product);
        return $this->setStatusCode(201)->success('成功');
    }

    public function favorites(){
        return $this->setStatusCode(201)->success(User::info()->favoriteProducts()->paginate(16));
    }
}
