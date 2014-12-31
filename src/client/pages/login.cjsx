'use strict';
React = window.React = require('react');

module.exports = React.createClass({

  render: ->
    return (
      <div className="jumbotron">
        <div className="container">
          <h1>koa-bootstrap-react-sample</h1>
          <div className="row">
            <div className="col-md-8">
              <p></p>
              coming soon!
            </div>
            <div className="col-md-4">
              <form role="form" action="/login" method="post" className="form">
                <div className="form-group">
                  <label for="input-username">Username</label>
                  <input id="input-username" type="text" placeholder="username" name="username" className="form-control"/>
                </div>
                <div className="form-group">
                  <label for="input-password">Password</label>
                  <input id="input-password" type="password" placeholder="password" name="password" className="form-control"/>
                </div>
                <button type="submit" className="btn btn-success pull-right">Connexion</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    );
});
