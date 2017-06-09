// Use when lists have memory from one render to the other
// Or when a list's order might be shuffled from one render to the next
var React = require('react');
var ReactDOM = require('react-dom');

var people = ['Rowe', 'Prevost', 'Gare'];

var peopleLIs = people.map(function(person, i){
  // return statement goes here:
  return <li key={'person_' + i}>{person}</li>;
});

// ReactDOM.render goes here:
ReactDOM.render(<ul>{peopleLIs}</ul>, document.getElementById('app'));