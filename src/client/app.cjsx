
'use strict';
React = window.React = require('react');
Router = require('react-router');
routes = require('./routes');

container = document.getElementById('page-container');


Router.run routes, (Handler) ->
  React.render(<Handler/>, container);
