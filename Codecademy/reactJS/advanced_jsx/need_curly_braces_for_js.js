var React = require('react');
var ReactDOM = require('react-dom');

// Write code here:
// Without curly braces, renders as 2 + 3 instead of 5
ReactDOM.render(<h1>{2 + 3}</h1>, document.getElementById('app'));


// More curly braces
var React = require('react');
var ReactDOM = require('react-dom');

// Write code here:
var math = <h1>2 + 3 = {2 + 3}</h1>;

ReactDOM.render(math, document.getElementById('app'));