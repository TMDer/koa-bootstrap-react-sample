
'use strict';
React = require('react');
Carousel = require('react-bootstrap/Carousel')
CarouselItem = require('react-bootstrap/CarouselItem')


module.exports = React.createClass({

  render: ->

    return (
      <Carousel>
        <CarouselItem>
          <img alt="900x500" src="/images/carousel.jpg"/>
          <div className="carousel-caption">
            <h3>First slide label</h3>
            <p>Nulla vitae elit libero, a pharetra augue mollis interdum.</p>
          </div>
        </CarouselItem>
        <CarouselItem>
          <img alt="900x500" src="/images/carousel.jpg"/>
          <div className="carousel-caption">
            <h3>Second slide label</h3>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
          </div>
        </CarouselItem>
        <CarouselItem>
          <img alt="900x500" src="/images/carousel.jpg"/>
          <div className="carousel-caption">
            <h3>Third slide label</h3>
            <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
          </div>
        </CarouselItem>
      </Carousel>
    );

});
