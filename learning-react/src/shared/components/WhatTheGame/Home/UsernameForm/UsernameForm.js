/* @flow */

import React from 'react';
import Helmet from 'react-helmet';

function UsernameForm() {
  return (
    <div>
      <form>
        <input type="text" placeholder="Your username" />
        <input type="text" placeholder="Your friend's username" />
      </form>
    </div>
  );
}

export default UsernameForm;
