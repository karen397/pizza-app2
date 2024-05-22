import React from 'react';
import './App.css';

function App() {
  const pizzas = [
    { id: 1, name: "Margherita", price: "€8.00", description: "Tomato sauce, mozzarella, fresh basil", img: "margherita.jpeg" },
    { id: 2, name: "Pepperoni", price: "€9.50", description: "Tomato sauce, mozzarella, spicy pepperoni", img: "pepperoni.jpeg" },
    { id: 3, name: "Quattro Formaggi", price: "€10.00", description: "Mozzarella, parmesan, gorgonzola, fontina", img: "quattro.jpeg" },
    { id: 4, name: "Diavola", price: "€9.00", description: "Tomato sauce, mozzarella, spicy salami, chili peppers", img: "diavola.jpeg" }
  ];

  return (
    <div>
      <header style={{ backgroundColor: 'tomato', color: 'white', padding: '10px 20px', textAlign: 'center' }}>
        <h1>Gino's Pizza Shop</h1>
        <p>Authentic Italian Pizza Delivered to Your Door</p>
      </header>
      <div style={{ display: 'flex', flexWrap: 'wrap', justifyContent: 'space-around', padding: '20px', backgroundColor: 'white' }}>
        {pizzas.map(pizza => (
          <div key={pizza.id} style={{ background: '#fff', border: '1px solid #ddd', padding: '10px', width: '30%', margin: '10px', textAlign: 'center' }}>
            <img src={`https://storage.cloud.google.com/dats575-projects/${pizza.img}`} alt={pizza.name} style={{ width: '100%', height: '200px', objectFit: 'cover' }} />
            <h3>{pizza.name}</h3>
            <p>{pizza.price}</p>
            <p>{pizza.description}</p>
            <button style={{ padding: '10px 20px', backgroundColor: 'tomato', color: 'white', border: 'none', cursor: 'pointer' }}>Order Now</button>
          </div>
        ))}
      </div>
      <footer style={{ textAlign: 'center', padding: '20px', background: '#ddd' }}>
        <p>Contact us: Via Roma 123, Rome | +39 012 345 6789</p>
      </footer>
    </div>
  );
}

export default App;
