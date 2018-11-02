<?php

namespace App\Http\Controllers;

use App\Game;

class GameController extends Controller
{
    public function index()
    {
        return Game::all();
    }

    public function show(Game $game)
    {
        return $game;
    }
}
