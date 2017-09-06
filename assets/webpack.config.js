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
              presets: ['env']
            }
          }
        ]
      },

      {
        test: /\.scss$/,
        use: extractSass.extract(['css-loader', 'sass-loader'])
      },

      {
        test: /\.vue$/,
        include: path.resolve('js'),
        use: 'vue-loader'
      }
    ]
  },

  plugins: [
    extractSass
  ],

  resolve: {
    extensions: ['.js', '.scss', '.vue'],
    modules: [ 'node_modules' ],
    alias: { 'vue$': 'vue/dist/vue.esm.js'}
  }
};

module.exports = config;
