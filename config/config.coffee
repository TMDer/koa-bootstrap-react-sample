"use strict"
path = require("path")
_ = require("lodash")
env = process.env.NODE_ENV = process.env.NODE_ENV or "development"
base = app:
  root: path.normalize(__dirname + "/..")
  env: env

mongoHost = process.env.MONGO_PORT_27017_TCP_ADDR or "localdocker"
specific =
  development:
    app:
      port: 3000
      name: "Koa React Gulp Mongoose Mocha - Dev"
      keys: ["super-secret-hurr-durr"]

    mongo:
      url: "mongodb://" + mongoHost + "/koareactfullexample_dev"

  test:
    app:
      port: 3001
      name: "Koa React Gulp Mongoose Mocha - Test realm"
      keys: ["super-secret-hurr-durr"]

    mongo:
      url: "mongodb://" + mongoHost + "/koareactfullexample_test"

  production:
    app:
      port: process.env.PORT or 3000
      name: "Koa React Gulp Mongoose Mocha"

    mongo:
      url: "mongodb://" + mongoHost + "/koareactfullexample"

module.exports = _.merge(base, specific[env])
