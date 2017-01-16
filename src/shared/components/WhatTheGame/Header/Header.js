/* @flow */

import React from 'react';
import Logo from './Logo';
import Menu from './Menu';

function Header() {
  return (
    <div className="page__header">
      <Logo />
      <Menu />
    </div>
  );
}

export default Header;
