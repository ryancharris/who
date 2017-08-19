const path = require('path');
const ExtractTextPlugin = require('extract-text-webpack-plugin');

const config = {
  entry: './js/app.js',

  devtool: 'inline-source-map',

  output: {
    path: path.resolve('../priv/static/js'),
    filename: 'app.js'
  },

  module: {
    rules: [
      {
        test: /\.js$/,
        include: [
          path.resolve('assets/js')
        ],
        use: [
          {
            loader: 'babel-loader',
            options: {
              presets: ['es2015', 'react']
            }
          }
        ]
      },

      {
        test: /\.scss$/,
        use: ExtractTextPlugin.extract({
          fallback: 'style-loader',
          publicPath: '../priv/static/css',
          use: ['css-loader', 'sass-loader']
        }),
      }
    ]
  },

  plugins: [
    new ExtractTextPlugin({
      filename: () => {
        return '../css/app.css'
      }
    })
  ],

  resolve: {
    extensions: ['.js', '.scss'],
    modules: [
      'node_modules',
      '../assets'
    ]
  }
};

module.exports = config;
