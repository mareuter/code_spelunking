// @flow
import React, { Component } from 'react';
import './App.css';
import Grid from './listings/Grid';
import courses from '../data/courses.json';

export default class App extends Component {
  state = {
    courses: Array
  }

  constructor(props: any) {
    super(props);
    this.state = { courses };
  }

  render() {
    return (
      <div>
        <div className="navbar-fixed">
          <nav className="blue lighten-2">
            <div className="nav-wrapper">
              <a href="#" className="brand-logo center">Courses</a>

            </div>
          </nav>
        </div>
        <div>
            <Grid items={this.state.courses}/>
        </div>
      </div>
    );
  }
}
