import React, { Fragment } from 'react'

import { rhythm, scale } from '../utils/typography'
import Link from 'gatsby-link';
import Container from './Container';
import Logo from './Logo';

import { css } from 'react-emotion';

class Header extends React.Component {
  constructor(props) {
    super(props);
    this.state = {isHovering: false};
  }

  handleMouseEnter = () => {
    this.setState({isHovering: true})
  };

  handleMouseLeave = () => {
    this.setState({isHovering: false})
  };

  render() {
      const { children } = this.props;
      const { isHovering } = this.state;


    return (
        <header onMouseEnter={this.handleMouseEnter} onMouseLeave={this.handleMouseLeave} css={css`
            background: ${isHovering ? '#fff' : '#000'};
            padding: ${rhythm(1)} ${rhythm(1)};
            border-bottom: 8px solid #fff;
            margin-bottom: ${rhythm(2)};
        `}>
            <Container>
                <Link
                    css={css`
                    border-bottom: none;
                    `}
                    to={'/'}
                >
                    <Logo type="black" width="100" />
                </Link>
            </Container>
        </header>
    )
  }
}

export default Header
