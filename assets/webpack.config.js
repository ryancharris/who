const path = require('path');

const config = {
  entry: './js/app.js',

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
        // include: [
        //   path.resolve('assets/scss')
        // ],
        use: [
          { loader: "style-loader" },
          { loader: "css-loader" },
          { loader: "sass-loader"}
        ]
      }
    ]
  },

  resolve: {
    extensions: ['.js', '.scss'],
    modules: [
      'node_modules',
      '../assets'
    ]
  }
}

module.exports = config;
