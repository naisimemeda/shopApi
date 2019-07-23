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
});
