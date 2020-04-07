import React, { Component } from 'react';
import PiggyBank from './PiggyBank';

function App() {
  return (
    <PiggyBank
      title="Savings Pig"
      depositAmount={5}
    />
  );
}

export default App;
