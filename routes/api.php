<?php
use Illuminate\Http\Request;
Route::post('users','UserController@store')->name('users.store');
Route::post('login','UserController@login')->name('users.login');
Route::get('products', 'ProductsController@index')->name('products.index');
Route::middleware('api.refresh')->group(function () {
    Route::get('users/info','UserController@info')->name('users.info');
    Route::get('logout','UserController@logout')->name('users.logout');
    Route::get('user_addresses', 'UserAddressesController@index')->name('user_addresses.index');
    Route::post('user_addresses', 'UserAddressesController@store')->name('user_addresses.store');
    Route::put('user_addresses/{user_address}', 'UserAddressesController@update')->name('user_addresses.update');
    Route::get('user_addresses/{user_address}', 'UserAddressesController@edit')->name('user_addresses.edit');
    Route::delete('user_addresses/{user_address}', 'UserAddressesController@destroy')->name('user_addresses.destroy');
    Route::post('products/{product}/favorite', 'ProductsController@favor')->name('products.favor');
    Route::delete('products/{product}/favorite', 'ProductsController@disfavor')->name('products.disfavor');
    Route::get('products/favorites', 'ProductsController@favorites')->name('products.favorites');
    Route::post('cart', 'CartController@add')->name('cart.add');
    Route::get('cart', 'CartController@index')->name('cart.index');
    Route::delete('cart/{sku}', 'CartController@remove')->name('cart.remove');
    Route::post('orders', 'OrdersController@store')->name('orders.store');
    Route::get('orders', 'OrdersController@index')->name('orders.index');
    Route::get('orders/{order}', 'OrdersController@show')->name('orders.show');
});
Route::get('payment/{order}/alipay', 'PaymentController@payByAlipay')->name('payment.alipay');
Route::get('products/{product}', 'ProductsController@show')->name('products.show');
Route::get('payment/alipay/return', 'PaymentController@alipayReturn')->name('payment.alipay.return');
Route::post('payment/alipay/notify', 'PaymentController@alipayNotify')->name('payment.alipay.notify');
