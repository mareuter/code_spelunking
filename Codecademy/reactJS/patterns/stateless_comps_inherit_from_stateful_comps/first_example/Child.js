var React = require('react');

var Child = React.createClass({
  render: function() {
    return <h1>Hey, my name is {this.props.name}!</h1>;
  }
});

module.exports = Child;