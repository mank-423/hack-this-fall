import React, { useState } from "react";


function Cards(){

  const [card] = useState([
    {
      title: 'Card',
      text:"Lorem ipsum dolor anski hawiaw"
    },

    {
      title: 'Card',
      text:"Lorem ipsum dolor anski hawiaw"
    },

    {
      title: 'Card',
      text:"Lorem ipsum dolor anski hawiaw"
    },
  ]);
  return (

    <div>
      <section>
        <div className="container">
          <h1 className="header-class">Resposnive cards</h1>
          <div className="cards">
            {cards.map((card, i)=>(
              <div key={i} className="card">
              <h3>{card.title}</h3>
              <p>
                {card.text}
              </p>
              <button className="btn-explore">Explore</button>
            </div>
            ))}
            
          </div>
        </div>
      </section>
    </div>
  );
};

export default Cards;