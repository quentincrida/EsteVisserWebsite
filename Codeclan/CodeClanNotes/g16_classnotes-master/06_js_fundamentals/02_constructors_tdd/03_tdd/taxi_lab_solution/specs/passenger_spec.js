const assert = require('assert');
const Passenger = require('../passenger.js');


describe('Passenger', function(){
  let passenger;

  beforeEach(function(){
    passenger = new Passenger('Homer', 42);
  });

  it('should have a name', function(){
    actual = passenger.name;
    assert.strictEqual(actual, 'Homer');
  })

  it('should have an age', function(){
    actual = passenger.age;
    assert.strictEqual(actual, 42);
  })
});
