//'use strict'; // cannot use 'use strict' with yield
var mongoose = require('mongoose');
var Post = mongoose.model('Post');
var marked = require('marked');

exports.create = function *() {
  var post = new Post(this.request.body);

  try {
    var post = yield post.save();

    console.log("post._id = " + post._id + " created");
    this.body = post;
  } catch (error) {
    new Error(error)
    console.log("post create error", error);
  }

};

exports.show = function *() {

  try {
    var post = yield Post.findById(this.params.id).exec();

    if(this.request.query["format"] === "md"){
      post.content = marked(post.content.replace(/↵/g, "\n"));

    }
    this.body = post
  } catch (error) {
    console.log("post show error", error);
  }

};
