/* @flow */

import React from 'react';
import Helmet from 'react-helmet';
import Games from '../Games';

const Compare = () => (
  <div>
    <Helmet title="Compare games" />
    <h1>Compare games</h1>
    <Games />
  </div>
);

export default Compare;