/* @flow */

import React from 'react';
import { Match, Miss } from 'react-router';
import Helmet from 'react-helmet';
import { CodeSplit } from 'code-split-component';
import 'normalize.css/normalize.css';
import './globals.css';
import Error404 from './Error404';
import Header from './Header';
import { safeConfigGet } from '../../utils/config';

function WhatTheGame() {
  return (
    <div>
      {/*
        All of the following will be injected into our page header.
        @see https://github.com/nfl/react-helmet
      */}
      <Helmet
        htmlAttributes={safeConfigGet(['htmlPage', 'htmlAttributes'])}
        titleTemplate={safeConfigGet(['htmlPage', 'titleTemplate'])}
        defaultTitle={safeConfigGet(['htmlPage', 'defaultTitle'])}
        meta={safeConfigGet(['htmlPage', 'meta'])}
        link={safeConfigGet(['htmlPage', 'links'])}
        script={safeConfigGet(['htmlPage', 'scripts'])}
      />

      <Header />

      <Match
        exactly
        pattern="/"
        render={routerProps =>
          <CodeSplit chunkName="home" modules={{ Home: require('./Home') }}>
            { ({ Home }) => Home && <Home {...routerProps} /> }
          </CodeSplit>
        }
      />

      <Miss component={Error404} />
    </div>
  );
}

export default WhatTheGame;
