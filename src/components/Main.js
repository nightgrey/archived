import React from 'react'

import Container from './Container';

import { rhythm } from '../utils/typography'

class Main extends React.Component {
  render() {
      const { children } = this.props;

    return (
        <div style={{
            backgroundColor: '#000d2b',
            overflow: 'hidden'
        }}>
            <Container>
                {children}
            </Container>
        </div>
    )
  }
}

export default Main
