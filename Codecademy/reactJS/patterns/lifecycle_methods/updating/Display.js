var React = require('react');

var style = {
  fontSize: 110,
  color:    'lightgrey',
  position: 'absolute',
  top: '30%'
};

function Display (props) {
  return (
    <div style={style}>
      {props.number}
    </div>
  );
}

Display.propTypes = {
  number: React.PropTypes.number.isRequired
};

module.exports = Display;