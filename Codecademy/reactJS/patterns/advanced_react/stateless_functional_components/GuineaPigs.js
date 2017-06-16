var React = require('react');

function GuineaPigs (props) {
  var src = props.src;
  return (
    <div>
      <h1>Cute Guinea Pigs</h1>
      <img src={src} />
    </div>
  );
}

module.exports = GuineaPigs;