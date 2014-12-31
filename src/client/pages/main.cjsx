
'use strict';
React = window.React = require('react');
Router = require('react-router');
Link = Router.Link;
RouteHandler = Router.RouteHandler;


module.exports = React.createClass({


  render: ->

    logButton = null
    index = <li><Link to='index'>Index</Link></li>

    lis = []

    lis.push(<li><Link to='index'>Index</Link></li>);


    if isLogin
      logButton = <li><a href="/logout"><span className="glyphicon glyphicon-off"></span> Log Out</a></li>

      lis.push(<li><p className="navbar-text"><span className="glyphicon glyphicon-user">{username}</span></p></li>);
      lis.push(<li><Link to='profile'>profile</Link></li>);
      lis.push(<li><Link to='postCreate'>post create</Link></li>);
      


    else
      logButton = <li><Link to='login'><span className="glyphicon glyphicon-off"></span> Log in</Link></li>


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

});
