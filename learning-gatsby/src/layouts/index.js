import React from 'react'

import '../utils/globalStyles';

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
