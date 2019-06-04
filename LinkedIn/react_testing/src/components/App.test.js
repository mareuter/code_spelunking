import React from 'react';
import renderer from 'react-test-renderer';
import App from './App';

// React, React-Dom and React-Test-Renderer MUST be the same version!!!!!
test('App snapshot test', () => {
  const component = renderer.create(<App />);
  const tree = component.toJSON();
  expect(tree).toMatchSnapshot();
});
