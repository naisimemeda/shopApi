<?php
use Illuminate\Http\Request;

Route::namespace('Api')->group(function () {
    Route::get('/users','UserController@index')->name('users.index');
    Route::post('/users','UserController@store')->name('users.store');
    Route::post('/login','UserController@login')->name('users.login');
    Route::middleware('api.refresh')->group(function () {
        //当前用户信息
        Route::get('/users/info','UserController@info')->name('users.info');
        //用户退出
        Route::get('/logout','UserController@logout')->name('users.logout');
    });
});