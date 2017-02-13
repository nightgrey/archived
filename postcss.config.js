module.exports = (context) => ({
  plugins: [
    require('postcss-lh')({
      rootSelector: 'html'
    })
  ]
});