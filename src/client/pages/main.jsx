/** @jsx React.DOM */
'use strict';
var React = window.React = require('react');
var Router = require('react-router');
var Link = Router.Link;
var RouteHandler = Router.RouteHandler;


module.exports = React.createClass({


  render: function () {

    var logButton
    var profileButton
    var user

    if(isLogin){
      logButton = <li><a href="/logout"><span className="glyphicon glyphicon-off"></span> Log Out</a></li>
      profileButton = <li><Link to='profile'>profile</Link></li>
      user = <li><p className="navbar-text"><span className="glyphicon glyphicon-user">{username}</span></p></li>
    }
    else {
      logButton = <li><Link to='login'><span className="glyphicon glyphicon-off"></span> Log in</Link></li>
    }

    var index = <li><Link to='index'>Index</Link></li>
    var lis = []
    lis.push(index);
    lis.push(user);
    lis.push(profileButton);
    lis.push(logButton);


    return (
      <div id="main">
        <div role="navigation" className="navbar navbar-inverse navbar-fixed-top">
          <div className="container">
            <div className="nabar-header"><a className="navbar-brand">koa-bootstrap-react-sample</a></div>
            <div className="navbar-collapse collapse">
              <ul id="navbarmenu" className="nav navbar-nav navbar-right">
                {lis}
              </ul>
            </div>
          </div>
        </div>
        <div className="container marketing">

          <RouteHandler/>

        </div>
      </div>
    );
  }
});
