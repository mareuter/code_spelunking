var React = require('react');
var ReactDOM = require('react-dom');
var styles = {
  background: 'lightblue', 
  color: 'darkred'
};

var styleMe = <h1 style={styles}>Please style me!  I am so bland!</h1>;

ReactDOM.render(
  styleMe, 
  document.getElementById('app')
);