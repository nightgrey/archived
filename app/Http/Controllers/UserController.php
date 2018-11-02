<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\User;

class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function show(User $user)
    {
        return $user;
    }

    public function edit(User $user) {
        $user = Auth::user();

        return view('user.edit', compact('user'));
    }

    public function update(User $user)
    {
        $authenticatedUser = Auth::user();

        $this->validate(request(), [
            'email' => 'required|email|unique:users,email,'. $authenticatedUser->id . ',id',
            'avatar' => 'nullable|string',
            'nintendo_friend_code' => 'nullable|string',
            'discord_tag' => 'nullable|string',
            'local_range' => 'nullable|numeric',
            'bio' => 'nullable|string',
            'age' => 'nullable|numeric'
        ]);

        $authenticatedUser->email = request('email');
        $authenticatedUser->avatar = request('avatar');
        $authenticatedUser->nintendo_friend_code = request('nintendo_friend_code');
        $authenticatedUser->discord_tag = request('discord_tag');
        $authenticatedUser->games = request('games');
        $authenticatedUser->local_range = request('local_range');
        $authenticatedUser->bio = request('bio');
        $authenticatedUser->age = request('age');

        $authenticatedUser->save();

        return back();
    }
}
