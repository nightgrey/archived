import React, { Fragment } from 'react'

import { rhythm, scale } from '../utils/typography'
import Link from 'gatsby-link';
import Container from './Container';
import Logo from './Logo';

class Header extends React.Component {
  render() {
      const { children } = this.props;

    return (
        <header style={{
            background: '#000d2b',
            padding: `${rhythm(1)} ${rhythm(1)}`
        }}>
            <Container>
                <Link
                    style={{
                    boxShadow: 'none',
                    textDecoration: 'none',
                    color: 'inherit',
                    }}
                    to={'/'}
                >
                    <Logo width="200" height="100" />
                </Link>
            </Container>
        </header>
    )
  }
}

export default Header
