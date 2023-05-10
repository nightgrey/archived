/* @flow */

import './globals.scss';
import Compare from './Compare';
import Error404 from './Error404';
import Header from './Header';
import Helmet from 'react-helmet';
import React from 'react';
import { CodeSplit } from 'code-split-component';
import { Match, Miss } from 'react-router';
import { safeConfigGet } from '../../utils/config';

function WhatTheGame() {
  return (
    <div className="page">
      <Helmet
        htmlAttributes={safeConfigGet(['htmlPage', 'htmlAttributes'])}
        titleTemplate={safeConfigGet(['htmlPage', 'titleTemplate'])}
        defaultTitle={safeConfigGet(['htmlPage', 'defaultTitle'])}
        meta={safeConfigGet(['htmlPage', 'meta'])}
        link={safeConfigGet(['htmlPage', 'links'])}
        script={safeConfigGet(['htmlPage', 'scripts'])}
      />

      <Header />

      <main className="page__content">
        <Match
          exactly
          pattern="/"
          render={routerProps =>
            <CodeSplit chunkName="home" modules={{ Home: require('./Home') }}>
              { ({ Home }) => Home && <Home {...routerProps} /> }
            </CodeSplit>
          }
        />

        <Match
          exactly
          pattern="/compare"
          render={routerProps =>
            <CodeSplit chunkName="compare" modules={{ Compare: require('./Compare') }}>
              { ({ Compare }) => Compare && <Compare {...routerProps} /> }
            </CodeSplit>
          }
        />

        <Miss component={Error404} />
      </main>

      <footer className="page__footer">
        &copy; WTG
      </footer>
    </div>
  );
}

export default WhatTheGame;
