import React from 'react';
import Card from './Card';
import data from '../data/data.json';

const Home = (props) => {
  return ( 
    <div className="Grid animated bounceInUp">
      {
        props.cards.map((card) => (
          <Card 
            duration={150} 
            key={card.id} 
            card={card} 
          />
        ))
      }
    </div>
  );
}
 
export default Home;
