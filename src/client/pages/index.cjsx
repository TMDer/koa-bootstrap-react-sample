
'use strict';
React = require('react');
carouselSets = require('../components/carouselSets');

module.exports = React.createClass({

  render: ->

    imgStyle = {
      width: "140px",
      height: "140px"
    }
    return (
      <div >
        <div className="row">
          <carouselSets />
        </div>
        <div className="row">
          <div className="col-lg-4">
            <img className="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" style={imgStyle} />
            <h2>Heading</h2>
            <p>AAA</p>
            <p><a className="btn btn-default" href="#" role="button">View details &raquo;</a></p>
          </div>
          <div className="col-lg-4">
            <img className="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" style={imgStyle} />
            <h2>Heading</h2>
            <p>BBB</p>
            <p><a className="btn btn-default" href="#" role="button">View details &raquo;</a></p>
          </div>
          <div className="col-lg-4">
            <img className="img-circle" src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" alt="Generic placeholder image" style={imgStyle} />
            <h2>Heading</h2>
            <p>CCC</p>
            <p><a className="btn btn-default" href="#" role="button">View details &raquo;</a></p>
          </div>
        </div>
      </div>
    );

})
