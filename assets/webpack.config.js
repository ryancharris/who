const path = require('path');

module.exports = {
  entry: '../assets/js/app.js',

  output: {
    path: path.resolve(__dirname, '../priv/static/js'),
    filename: 'app.js'
  },

  module: {
    rules: [
      {
        test: /\.js$/,
        include: path.resolve(__dirname, '../assets'),
        exclude: path.resolve(__dirname, 'node_modules'),
        loader: 'babel-loader',
        options: {
          presets: ['es2015', 'react']
        }
      }
    ]
  }
}
