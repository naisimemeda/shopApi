<?php
use Illuminate\Http\Request;
Route::post('users','UserController@store')->name('users.store');
Route::post('login','UserController@login')->name('users.login');
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
});
Route::get('products', 'ProductsController@index')->name('products.index');
Route::get('products/{product}', 'ProductsController@show')->name('products.show');
