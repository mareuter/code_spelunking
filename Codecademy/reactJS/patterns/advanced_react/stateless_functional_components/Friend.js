var React = require('react');
var ReactDOM = require('react-dom');

function Friend () {
  return <img src='https://s3.amazonaws.com/codecademy-content/courses/React/react_photo-octopus.jpg' />;
}

ReactDOM.render(
  <Friend />,
  document.getElementById('app')
);