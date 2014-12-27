"use strict";
/**
 * Dependencies
 */
var gulp = require("gulp");
var nodemon = require("gulp-nodemon");
var browserify = require("browserify");
var concat = require("gulp-concat");
var minifyCSS = require('gulp-minify-css');
var react = require("gulp-react");
var sourcemaps = require("gulp-sourcemaps");
var source = require("vinyl-source-stream");
var envify = require("envify");
var shim = require("browserify-shim");

var compass = require('gulp-compass')

// Config
var config = require("./config/gulp");
var paths = config.paths;

// Hack around nodemon, that doesn"t wait for tasks to finish on change
var nodemon_instance;

function handleStreamError (err) {
  console.log(err.toString());
  this.emit("end");
}

/**
 * Sub-Tasks
 */
gulp.task("jsx-compile", function () {
  return gulp.src(paths.in.jsx)
  .pipe(react())
  .on("error", handleStreamError)
  .pipe(gulp.dest(paths.out.build_js));
});

gulp.task("copy-js", function () {
  return gulp.src(paths.in.js)
  .pipe(gulp.dest(paths.out.build_js));
});

gulp.task("copy-fonts", function () {
  return gulp.src(paths.in.fonts)
  .pipe(gulp.dest(paths.out.fonts));
});


gulp.task("app-bundle", ["jsx-compile", "copy-js", "copy-fonts"], function() {
  return browserify({
      entries: paths.in.app,
      debug: true,
    })
    .require("react")
    .transform(shim)
    .transform(envify)
    .bundle()
    .pipe(source("bundle.js"))
    .pipe(gulp.dest(paths.out.public));
});


gulp.task("app-compile", ["app-bundle"], function() {
  paths.in.bower_js.push("public/bundle.js");

  gulp.src(paths.in.bower_js)
  .pipe(concat('app.js'))
  .pipe(gulp.dest(paths.out.public));

});

// ==========
// css / scss
// ==========


gulp.task('scss-compile', function () {
  gulp.src(['src/client/scss/app.scss'])
  .pipe(compass({
    sass: 'src/client/scss',
    image: 'src/client/img',
    css: 'public',
    import_path: ['bower_components/bootstrap-sass-official/vendor/assets/stylesheets']
  }))
  .pipe(gulp.dest('public'))
  ;
});

gulp.task('watch-scss', ['compile-scss'], function () {
  gulp.watch(['public/scss/*.scss'], ['compile-scss']);
});



gulp.task("install", ["app-compile", "scss-compile"]);

gulp.task("watch", function () {
  gulp.watch(paths.in.jsx, ["app-compile"]);
  gulp.watch(paths.in.scss, ["scss-compile"]);
  gulp.watch(paths.toWatch, ["nodemon"]);
});

gulp.task("nodemon", function () {
  if(!nodemon_instance)
    nodemon_instance = nodemon({ script:"server.js", nodeArgs: ["--harmony", "--debug"],
    env: { "NODE_ENV": "development" }, watch: "__manual_watch__",  ext: "__manual_watch__"  });
  else {
    nodemon_instance.emit("restart");
  }
});

/**
 * Global tasks
 */
gulp.task("dev", ["install", "watch", "nodemon"]);

gulp.task("default", ["install"]);
