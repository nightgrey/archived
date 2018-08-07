import React from 'react'
import Link from 'gatsby-link'

import 'typeface-montserrat'
import 'typeface-merriweather'

import { rhythm, scale } from '../utils/typography'
import Container from '../components/Container';
import Header from '../components/Header';

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
