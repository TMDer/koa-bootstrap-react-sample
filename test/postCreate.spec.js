var app, authHelper, co, databaseHelper, request, should;

should = require('should');
app = require('../server');
request = require('supertest').agent(app.listen());
databaseHelper = require('./middlewares/database');
authHelper = require('./middlewares/authenticator');
var mongoose = require('mongoose');
var Post = mongoose.model('Post');
var co = require('co');

describe('Post', function() {
  it('create', function(done) {
    request.post('/post')
    .send({
      title: "hello",
      description: "haha",
      imagesrc: "data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==",
      content: "# yoyo↵↵## YOYO"
    })
    .expect(200)
    .end(function(error, res) {
      (error == null).should.be.true

      var createPost = res.body
      createPost.should.have.properties("title", "description", "content", "imagesrc");

      done();
    });
  });

  describe('show', function() {

    testPost = {}

    before(function (done) {
      co(function *() {

        var post = new Post({
          title: "hello",
          description: "haha",
          imagesrc: "data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==",
          content: "# yoyo↵↵## YOYO"
        });
        testPost = yield post.save()


      })(done);

    });

    it('json', function(done) {
      request.get('/post/'+testPost._id)
      .expect(200)
      .end(function(error, res) {
        (error == null).should.be.true
        var showPost = res.body
        showPost.should.have.properties("title", "description", "content", "imagesrc");



        done();
      });
    });
    it('markdown', function(done) {
      request.get('/post/'+testPost._id+"?format=md")
      .expect(200)
      .end(function(error, res) {
        (error == null).should.be.true
        var showPost = res.body
        showPost.should.have.properties("title", "description", "content", "imagesrc");
        showPost.content.should.startWith('<h1 ');

        done();
      });
    });


  });

  after(function(done) {
    databaseHelper.dropDatabase(done);
  });
});
