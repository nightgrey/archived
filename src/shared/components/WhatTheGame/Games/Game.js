/* @flow */

import React from 'react';

const Game = ({game}) => {
  return (
    <li>
      <span>{game.title}</span><br />
      <span>ID: {game.id}</span>
    </li>
  );
};

export default Game;
