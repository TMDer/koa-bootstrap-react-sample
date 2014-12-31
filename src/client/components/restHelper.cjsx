
request = require('superagent');

module.exports.get = (url, cb) ->
  request.get(url)
  .set('Content-Type', 'application/json')
  .end(cb);

module.exports.post = (url, params, cb) ->
  request.post(url)
  .send(params)
  .set('Content-Type', 'application/json')
  .end(cb);
