/* @flow */

import React from 'react';
import { Link } from 'react-router';

function Menu() {
  return (
    <ul>
      <li><Link to="/">Home</Link></li>
      <li><Link to="/compare">Compare</Link></li>
    </ul>
  );
}

export default Menu;
