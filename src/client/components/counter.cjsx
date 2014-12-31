
'use strict';
React = require('react');
restHelper = require('./restHelper');



module.exports = React.createClass({
  getInitialState: ->
    return { count : this.props.initialCount || 0 };

  componentWillMount: ->
    restHelper.get('/value', ((res) ->
      this.setState({count: res.body.count});
    ).bind(this));

  onClickInc: (event) ->
    event.preventDefault();
    restHelper.get('/inc', ((res) ->
      this.setState({count: res.body.count});
    ).bind(this));

  onClickDec: (event) ->
    event.preventDefault();
    restHelper.get('/dec', ((res) ->
      this.setState({count: res.body.count});
    ).bind(this));

  render: ->
    return (
      <div>
        <h3>Counter</h3>
        <div className="counter">Count&nbsp;
          <a href="#" onClick={this.onClickInc}>(Click to increment)</a>&nbsp;
          <a href="#" onClick={this.onClickDec}>(Click to decrement)</a>&nbsp;
          <span>{this.state.count}</span>
        </div>
      </div>
    );

});
