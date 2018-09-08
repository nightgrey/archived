import React from 'react';
import { css } from 'react-emotion';

const Thumbnail = (props) => {
  const { image } = props;

  if(!image) {
    return null;
  }

  return (
      <div css={css`
      position: relative;
      display: block;
      max-width: 1200px;
      margin-left: auto;
      margin-right: auto;
    `}>
      <div css={css`
        padding-bottom: 75%;
        position: relative;
        bottom: 0;
        left: 0;
        background-image: url('${image.base64}');
        background-size: cover;
      `}>
        <img 
        css={css`
          width: 100%;
          height: 100%;
          margin: 0;
          vertical-align: middle;
          position: absolute;
          left: 0;
          top: 0;
        `}
        src={image.src}
        srcSet={image.srcset}
        sizes={image.sizes}
        />
      </div>
    </div>
  )
};

export default Thumbnail;