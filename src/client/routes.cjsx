
'use strict';
React = window.React = require('react');
reactNestedRouter = require('react-router');

Route = reactNestedRouter.Route;
Link = reactNestedRouter.Link;

Index = require('./pages/index');
Profile = require('./pages/profile');
Main = require('./pages/main');
Login = require('./pages/login');
PostCreate = require('./pages/post/create');
PostShow = require('./pages/post/show');


module.exports = (
  <Route handler={Main}>
    <Route name='login' path='/login' handler={Login} />
    <Route name='profile' path='/profile' handler={Profile} />
    <Route name='index' path='/' handler={Index} />
    <Route name='postCreate' path='/post/create' handler={PostCreate} />
    <Route name='postShow' path='/post/:postId' handler={PostShow} />
  </Route>
);
