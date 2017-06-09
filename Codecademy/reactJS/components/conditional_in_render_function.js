var React = require('react');
var ReactDOM = require('react-dom');

var fiftyFifty = Math.random() < 0.5;

// React.createClass call begins here:
var TonightsPlan = React.createClass({
  render: function() {
    var plan;
    if (fiftyFifty) {
      plan = "Tonight I'm going out WOOO";
    } else {
      plan = "Tonight I'm going to bed WOOO";
    }
    return <h1>{plan}</h1>;
  }
});

ReactDOM.render(<TonightsPlan />, document.getElementById('app'));