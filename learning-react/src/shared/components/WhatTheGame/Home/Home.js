/* @flow */

import React from 'react';
import Helmet from 'react-helmet';
import UsernameForm from './UsernameForm';
import Games from '../Games';

function Home() {
  return (
    <article>
      <Helmet title="Home" />
      <p>
        It's 8PM, you're in Discord with your friends and you don't know what the heck you should play? Well, no problem. Enter your and your friend's steam username and you're good to go!
      </p>
      <UsernameForm />
      <Games />
    </article>
  );
}

export default Home;
