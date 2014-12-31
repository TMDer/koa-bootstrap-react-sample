'use strict';
/**
 * Dependencies
 */

var mongoose = require('mongoose');
var Schema = mongoose.Schema;

/**
 * Schema
 */
var PostSchema = new Schema({
  title: { type: String },
  description: { type: String },
  content: { type: String },
  imagesrc: {type: String },
  updated: { type: Date, default: Date.now }
});

PostSchema.pre('save', function (next) {
    this.updated = new Date();
    next();
});

mongoose.model('Post', PostSchema);
