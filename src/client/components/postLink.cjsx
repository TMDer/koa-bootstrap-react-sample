
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
      <div className="col-lg-4">
        <img className="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" style={imgStyle} />
        <h2>Heading</h2>
        <p>AAA</p>
        <p><a className="btn btn-default" href="#" role="button">View details &raquo;</a></p>
      </div>
    );

});
