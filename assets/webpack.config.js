const path = require('path');

const config = {
  entry: '../assets/js/app.js',

  output: {
    path: path.resolve(__dirname, '../priv/static/js'),
    filename: 'app.js'
  },

  module: {
    rules: [
      {
        test: /\.js$/,
        include: path.resolve(__dirname, 'assets/'),
        loader: 'babel-loader',
        options: {
          presets: ['es2015', 'react']
        }
      },

      {
        test: /\.scss$/,
        use: [{
          loader: 'sass-loader',
          options: {
            includePaths: path.resolve(__dirname, 'assets/scss')
          }
        }]
      }
    ]
  },

  resolve: {
    extensions: ['.js'],
    modules: [
      'node_modules'
    ]
  }
}

module.exports = config;
