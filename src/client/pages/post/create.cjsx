
React = require('react');
t = require('tcomb-form');
restHelper = require('../../components/restHelper');

Post = t.struct({
  title: t.Str,
  description: t.maybe(t.Str),
  content: t.Str
});

Form = t.form.create(Post, {
  auto: 'labels',
  fields: {
    content: {
      type: 'textarea'
      config: {
        height: "100vh"
      }
    }
  }
});

module.exports = React.createClass({
  componentDidMount: () ->

  onClick: ->
    value = this.refs.form.getValue()

    console.log "value", value

    restHelper.post "/post", value, (res) ->



  render: ->
    return (
      <div>
        <Form ref='form' />
        <button onClick={this.onClick} className='btn btn-primary' >
          submit
        </button>
      </div>
    );

})
