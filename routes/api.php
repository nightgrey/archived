<?php

use Illuminate\Http\Request;
use App\Game;
use App\User;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// User
Route::get('/users/{user}', 'UserController@show');

Route::group(['middleware' => 'auth:api'], function() {
    Route::patch('users/update', 'UserController@update');
});
// Authentication
Route::post('auth/register', 'Auth\RegisterController@register');
Route::post('auth/login', 'Auth\LoginController@login');
Route::post('auth/logout', 'Auth\LoginController@logout');

// Games
Route::group(['middleware' => 'auth:api'], function() {
    Route::get('games', 'GameController@index');
    Route::get('games/{game}', 'GameController@show');
});
