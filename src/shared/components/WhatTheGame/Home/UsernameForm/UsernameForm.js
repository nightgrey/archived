/* @flow */

import React from 'react';
import Helmet from 'react-helmet';

function UsernameForm() {
  return (
    <div>
      <Helmet title="Usernames" />
      <input type="text" placeholder="Your username" />
      <input type="text" placeholder="Your friend's username" />
    </div>
  );
}

export default UsernameForm;
