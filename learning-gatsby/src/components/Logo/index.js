import React from 'react'

import Image from './nn-3d--white.svg';

class Logo extends React.Component {
  render() {
    const { width, height, type } = this.props;

    return <img
        style={{
            display: 'block',
            marginBottom: 0
        }} 
        src={Image}
        width={width} 
        height={height}
    />
  }
}

export default Logo
