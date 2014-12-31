
React = require('react');
restHelper = require('../../components/restHelper');
reactNestedRouter = require('react-router');
State = reactNestedRouter.State;


module.exports = React.createClass({
  mixins: [State]

  getInitialState: () ->
    id = this.getParams().postId

    that = this

    restHelper.get "/post/"+id+"?format=md", (res) ->
      post = res.body
      that.setState({body: post.content})

    return {body: "loading"}

  render: ->
    return (
      <div dangerouslySetInnerHTML={{
        __html: this.state.body
      }} />

    );

})
