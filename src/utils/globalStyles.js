import { injectGlobal } from 'emotion';
import 'typeface-ibm-plex-sans';
import { rhythm, scale } from './typography'

injectGlobal`
  body {
    background: #222;
  }
  
  a {
    color: #fff;
    display: inline-block;
    margin: 0 ${rhythm(0.25)};
    text-decoration: none;
    border-bottom: 2px solid #fff;
  }
`;