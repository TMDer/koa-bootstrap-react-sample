'use strict';
var root = require('path').normalize(__dirname + '/..');

module.exports = {
  paths: {
    input: {
      scss: root + '/src/client/scss/*.scss',
      cjsx: root + '/src/client/**/*.cjsx',
      js: root + '/src/client/**/*.js',
      app: root + '/build/app',
      fonts: root + '/bower_components/bootstrap-sass-official/vendor/assets/fonts/bootstrap/*',
      images: root + '/src/client/images/*'
    },
    output: {
      build_js: root + '/build',
      public: root + '/public',
      fonts: root + '/public/fonts',
      images: root + '/public/images'
    },
    toWatch: [root + '/src/**/*.js', root + '/config/*.js', root + '/server.js', root + '/lib/*.js']
  }
};
