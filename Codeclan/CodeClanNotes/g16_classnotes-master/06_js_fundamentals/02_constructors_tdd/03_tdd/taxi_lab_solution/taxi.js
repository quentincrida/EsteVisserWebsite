const Taxi = function(manufacturer, model, driver, capacity){
  this.manufacturer = manufacturer;
  this.model = model;
  this.driver = driver;
  this.passengers = [];
  this.capacity = capacity;
}

Taxi.prototype.numberOfPassengers = function(){
  return this.passengers.length;
}

Taxi.prototype.addPassenger = function(passenger){
  if (this.numberOfPassengers() < this.capacity){
    this.passengers.push(passenger);
  }
}

Taxi.prototype.removePassenger = function (name) {
  let foundPassenger;

  for (let passenger of this.passengers){
    if (passenger.name === name) {
      foundPassenger = passenger
    }
  }

  let index = this.passengers.indexOf(foundPassenger);

  this.passengers.splice(index, 1);
};


Taxi.prototype.removeAllPassengers = function () {
  this.passengers.splice(0, this.passengers.length)
};

Taxi.prototype.getpassengersUnderAge12 = function () {
  const foundPassengers = [];
  for (let passenger of this.passengers){
    if (passenger.age < 12) {
      foundPassengers.push(passenger)
    }
  }

  return foundPassengers;
};

module.exports = Taxi;
