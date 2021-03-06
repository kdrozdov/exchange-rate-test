// Note: You must restart bin/webpack-watcher for changes to take effect

const webpack = require('webpack')
const { env } = require('process')
const path = require('path')
const process = require('process')
const glob = require('glob')
const extname = require('path-complete-extname')

let distDir = process.env.WEBPACK_DIST_DIR

if (distDir === undefined) {
  distDir = 'packs'
}

const adminEntry = path.join('app', 'javascript', 'packs', 'admin', '*.js*')
const appEntry = path.join('app', 'javascript', 'packs', 'application', '*.js*')
const entry = '{' + appEntry + ',' + adminEntry + '}'

const config = {
  entry: glob.sync(entry).reduce(
    (map, entry) => {
      const basename = path.basename(entry, extname(entry))
      const localMap = map
      localMap[basename] = path.resolve(entry)
      return localMap
    }, {}
  ),

  output: { filename: '[name].js', path: path.resolve('public', distDir) },

  module: {
    rules: [
      {
        test: /\.css$/,
        loaders: ['style-loader','css-loader']
      },
      {
        test: /.vue$/, loader: 'vue-loader',
        options: {
          loaders: {
            'scss': 'vue-style-loader!css-loader!sass-loader',
            'sass': 'vue-style-loader!css-loader!sass-loader?indentedSyntax'
          }
        }
      },
      {
        test: /\.(jpeg|png|gif|svg|eot|ttf|woff|woff2)$/i,
        loader: 'url-loader'
      },
      { test: /\.coffee(\.erb)?$/, loader: 'coffee-loader' },
      {
        test: /\.js(\.erb)?$/,
        exclude: /node_modules/,
        loader: 'babel-loader',
        options: {
          presets: [
            ['latest', { es2015: { modules: false } }]
          ]
        }
      },
      {
        test: /\.erb$/,
        enforce: 'pre',
        exclude: /node_modules/,
        loader: 'rails-erb-loader',
        options: {
          runner: 'DISABLE_SPRING=1 bin/rails runner'
        }
      }
    ]
  },

  plugins: [
    new webpack.EnvironmentPlugin(Object.keys(process.env))
  ],

  resolve: {
    alias: { 'vue$':'vue/dist/vue.common.js' },
    extensions: ['.js', '.coffee'],
    modules: [
      path.resolve('app/javascript'),
      path.resolve('node_modules')
    ]
  },

  resolveLoader: {
    modules: [path.resolve('node_modules')]
  }
}

module.exports = {
  distDir,
  config
}
