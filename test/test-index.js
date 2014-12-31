/**
 * Dependencies
 */
var should = require('should');
var app = require('../server');
var request = require('supertest').agent(app.listen());
var databaseHelper = require('./middlewares/database');
var authHelper = require('./middlewares/authenticator');


// support for es6 generators
var co = require('co');

describe('Index', function () {

  before(function (done) {
    co(function *() {
        yield authHelper.createUser();
    })(done);
  });

  describe('Anonymous calls', function () {
    it('should return 200 to /, on client, redirect to "/#/login" by react router', function (done) {
      request.get('/')
      .expect(200)
      .end(done);
    });
  });

  describe('Auth calls', function () {
    before(function (done) {
      authHelper.signAgent(request, done);
    });

    it('should render the page', function (done) {
      request.get('/')
      .expect(200)
      .end(function (err, res) {
        if(err) return done(err);

        (res.text.indexOf("var isLogin = true") >= 0).should.be.true;
        (res.text.indexOf('var username = "test@email.com";') >= 0).should.be.true;

        done();
      });
    });
  });

  after(function (done) { databaseHelper.dropDatabase(done); });
});
