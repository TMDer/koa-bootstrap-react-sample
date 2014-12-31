
###*
Dependencies
###

# Config

# Hack around nodemon, that doesn"t wait for tasks to finish on change
handleStreamError = (err) ->
  console.log err.toString()
  @emit "end"
  return

gulp = require("gulp")
nodemon = require("gulp-nodemon")
browserify = require("browserify")
concat = require("gulp-concat")
minifyCSS = require("gulp-minify-css")
cjsx = require("gulp-cjsx")
sourcemaps = require("gulp-sourcemaps")
source = require("vinyl-source-stream")
envify = require("envify")
shim = require("browserify-shim")
compass = require("gulp-compass")
config = require("./config/gulp")
paths = config.paths
nodemon_instance = undefined

###*
Sub-Tasks
###
gulp.task "cjsx-compile", ->
  gulp.src(paths.input.cjsx).pipe(cjsx(bare: true)).on("error", handleStreamError).pipe gulp.dest(paths.output.build_js)

gulp.task "copy-js", ->
  gulp.src(paths.input.js).pipe gulp.dest(paths.output.build_js)

gulp.task "copy-fonts", ->
  gulp.src(paths.input.fonts).pipe gulp.dest(paths.output.fonts)

gulp.task "copy-images", ->
  gulp.src(paths.input.images).pipe gulp.dest(paths.output.images)

gulp.task "app-compile", [
  "cjsx-compile"
  "copy-js"
  "copy-fonts"
  "copy-images"
], ->
  browserify(
    entries: paths.input.app
    debug: true
  ).require("react").transform(shim).transform(envify).bundle().pipe(source("app.js")).pipe gulp.dest(paths.output.public)

gulp.task "scss-compile", ->
  gulp.src(["src/client/scss/app.scss"]).pipe(compass(
    sass: "src/client/scss"
    image: "src/client/img"
    css: "public"
    import_path: ["bower_components/bootstrap-sass-official/vendor/assets/stylesheets"]
  )).pipe gulp.dest("public")
  return

gulp.task "watch-scss", ["compile-scss"], ->
  gulp.watch ["public/scss/*.scss"], ["compile-scss"]
  return

gulp.task "install", [
  "app-compile"
  "scss-compile"
]
gulp.task "watch", ->
  gulp.watch paths.input.cjsx, ["app-compile"]
  gulp.watch paths.input.scss, ["scss-compile"]
  gulp.watch paths.toWatch, ["nodemon"]
  return

gulp.task "nodemon", ->
  unless nodemon_instance
    nodemon_instance = nodemon(
      script: "server.js"
      nodeArgs: [
        "--harmony"
        "--debug"
      ]
      env:
        NODE_ENV: "development"

      watch: "__manual_watch__"
      ext: "__manual_watch__"
    )
  else
    nodemon_instance.emit "restart"
  return


###*
Global tasks
###
gulp.task "dev", [
  "install"
  "watch"
  "nodemon"
]
gulp.task "default", ["install"]
