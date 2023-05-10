/* @flow */

import React, { Component, PropTypes } from 'react';
import Game from './Game';

class Games extends Component {
  render() {
    // @TODO: Retrieve actual games array from API.
    const games = [
      {
        id: 0,
        title: 'AAA'
      },
      {
        id: 1,
        title: 'BBB'
      },
      {
        id: 2,
        title: 'CCC'
      }
    ];

    return (
      <ul>
        {games.map(game =>
          <Game
            game={game}
            key={game.id}
          />
        )}
      </ul>
    );
  }
}

export default Games;
