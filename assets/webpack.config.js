const path = require('path');

module.exports = {
  entry: "../assets/js/app.js",
  output: {
    filename: "app.js",
    path: path.resolve(__dirname, '../priv/static/js')
  }
}
