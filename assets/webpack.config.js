const path = require('path');
const ExtractTextPlugin = require('extract-text-webpack-plugin');

const extractSass = new ExtractTextPlugin({
  filename: path.resolve('/css/app.css'),
  allChunks: true
});

const config = {
  devtool: 'source-map',

  entry: [
    path.resolve('js/app.js'),
    path.resolve('scss/app.scss')
  ],

  output: {
    path: path.resolve('../priv/static'),
    filename: 'js/app.js'
  },

  module: {
    rules: [
      {
        test: /\.js$/,
        include: path.resolve('js'),
        use: [
          {
            loader: 'babel-loader',
            options: {
              presets: ['latest']
            }
          }
        ]
      },

      {
        test: /\.scss$/,
        use: extractSass.extract(['css-loader', 'sass-loader'])
      },
    ]
  },

  plugins: [
    extractSass
  ],

  resolve: {
    extensions: ['.js', '.scss'],
    modules: [
      'node_modules'
    ]
  }
};

module.exports = config;
