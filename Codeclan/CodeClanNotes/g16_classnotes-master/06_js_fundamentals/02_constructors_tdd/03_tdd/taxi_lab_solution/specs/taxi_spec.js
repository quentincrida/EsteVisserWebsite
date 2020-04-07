const assert = require('assert');
const Taxi = require('../taxi.js');
const Passenger = require('../passenger.js');

describe('Taxi', function() {
  let taxi;
  let passenger1;
  let passenger2;

  beforeEach(function(){
   taxi = new Taxi('Toyota', 'Prius', 'Jack', 2);
   passenger1 = new Passenger('Homer', 42);
   passenger2 = new Passenger('Bart', 11);
  });

  it('should have a manufacturer', function(){
    const actual = taxi.manufacturer;
    assert.strictEqual(actual, 'Toyota');
  });

  it('should have a model', function(){
    const actual = taxi.model;
    assert.strictEqual(actual, 'Prius');
  });

  it('should have a capacity', function(){
    const actual = taxi.capacity;
    assert.strictEqual(actual, 2);
  });

  it('should have a driver', function(){
    const actual = taxi.driver;
    assert.strictEqual(actual, 'Jack');
  });

    describe('passengers', function(){
      it('should start off with no passengers', function(){
        const actual = taxi.passengers;
        assert.deepStrictEqual(actual, []);
      });

      it('can get back the number of passengers', function(){
        const actual = taxi.numberOfPassengers();
        assert.strictEqual(actual, 0);
      });

      it('can add a passenger', function(){
        taxi.addPassenger(passenger1);
        const actual = taxi.numberOfPassengers();
        assert.strictEqual(actual, 1);
      });

      it('can remove a passenger by name', function(){
        taxi.addPassenger(passenger1);
        taxi.addPassenger(passenger2);
        taxi.removePassenger('Homer');
        const actual = taxi.passengers;
        assert.deepStrictEqual(actual, [passenger2])
      });

      it('can remove all passengers', function(){
        taxi.addPassenger(passenger1);
        taxi.addPassenger(passenger2);
        taxi.removeAllPassengers();
        const actual = taxi.numberOfPassengers();
        assert.strictEqual(actual, 0);
      });

      it('can get all passengers under 12', function(){
        taxi.addPassenger(passenger1);
        taxi.addPassenger(passenger2);
        const actual = taxi.getpassengersUnderAge12();
        assert.deepStrictEqual(actual, [passenger2]);
      });

      it('cannot add more passengers than capacity', function(){
        taxi.addPassenger(passenger1);
        taxi.addPassenger(passenger2);
        taxi.addPassenger(passenger1);
        const actual = taxi.numberOfPassengers();
        assert.strictEqual(actual, 2);
      })


    });
});
