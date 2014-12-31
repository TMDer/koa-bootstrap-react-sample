
'use strict';
React = require('react');
Counter = require('../components/counter');

Authentication = {
  statics: {
    willTransitionTo: (transition) ->
      transition.redirect('/login') unless isLogin
  }
};

module.exports = React.createClass({
  mixins: [ Authentication ],
  render: ->
    return (
      <div>
        <h2>Index - Super Counter</h2>
        <Counter />
      </div>
    );

})
