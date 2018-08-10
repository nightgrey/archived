import React from 'react'
import Link from 'gatsby-link'

import { injectGlobal } from 'emotion';

import { rhythm, scale } from '../utils/typography'
import Container from '../components/Container';
import Header from '../components/Header';

injectGlobal`
  a {
    color: #fff;
    display: inline-block;
    padding: ${rhythm(0.25)} ${rhythm(0.3)};
    margin: 0 ${rhythm(0.25)}
    text-decoration: none;
    border: 2px solid #fff;
  }
`;

class Template extends React.Component {
  render() {
    const { location, children } = this.props

    return (
      <div>
        <Header />
        {children()}
      </div>
    )
  }
}

export default Template
