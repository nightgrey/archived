<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
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

    public function store(Request $request)
    {
        $game = Game::create($request->all());

        return response()->json($game, 201);
    }

    public function update(Request $request, Game $game)
    {
        $game->update($request->all());

        return response()->json($game, 200);
    }

    public function delete(Game $game)
    {
        $game->delete();

        return response()->json(null, 204);
    }
}
