import React from 'react'

import { rhythm } from '../utils/typography'

class Container extends React.Component {
  render() {
      const { children } = this.props;

    return (
        <div style={{
            marginLeft: 'auto',
            marginRight: 'auto',
            padding: `0 ${rhythm(1)}`,
            maxWidth: '1000px'
        }}>
            {children}
        </div>
    )
  }
}

export default Container
