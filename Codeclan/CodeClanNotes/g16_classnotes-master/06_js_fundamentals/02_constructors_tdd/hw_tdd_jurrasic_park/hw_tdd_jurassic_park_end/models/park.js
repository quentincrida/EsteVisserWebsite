const Park = function (name, ticketPrice) {
  this.name = name;
  this.ticketPrice = ticketPrice;
  this.dinosaurs = [];
}

Park.prototype.add = function (dinosaur) {
  this.dinosaurs.push(dinosaur);
}

Park.prototype.remove = function(dinosaur) {
  let index = this.dinosaurs.indexOf(dinosaur);
  this.dinosaurs.splice(index, 1);
}

Park.prototype.findMostAttractiveDinosaur = function () {
  let topDino = this.dinosaurs[0];
  for (let dinosaur of this.dinosaurs){
    if (dinosaur.guestsAttractedPerDay > topDino.guestsAttractedPerDay) {
      topDino = dinosaur;
    }
  }

  return topDino;
};


Park.prototype.findBySpecies = function (species) {
  const foundSpecies = [];

  for (let dinosaur of this.dinosaurs){
    if (dinosaur.species === species) {
      foundSpecies.push(dinosaur);
    }
  }
  return foundSpecies;
};

Park.prototype.calculateAverageVisitorsPerDay = function () {
   let guests = 0;
  for (let dino of this.dinosaurs){
    guests = guests + dino.guestsAttractedPerDay;
  }

  return guests;
};

Park.prototype.calculateAverageVisitorsPerYear = function () {
  return this.calculateAverageVisitorsPerDay() * 365;
}

Park.prototype.calculateAverageYearlyRevenue = function () {
  return this.calculateAverageVisitorsPerYear() * this.ticketPrice;
};

Park.prototype.removeBySpecies = function (species) {
  let listOfDinos = this.findBySpecies(species);

  for (let dino of listOfDinos){
    this.remove(dino);
  }
};

Park.prototype.numberOfDinosaursByDiet = function(){
  let carnivores = 0;
  let herbivores = 0;
  let omnivores = 0;

  for (let dino of this.dinosaurs) {
    if (dino.diet === 'carnivore'){
      carnivores++;
    } else if (dino.diet === 'herbivore') {
      herbivores++;
    } else if (dino.diet === 'omnivore') {
      omnivores++;
    }
  }

  return {
    carnivore: carnivores,
    herbivore: herbivores,
    omnivore: omnivores
  }

  // const dinosaurDiets = {};
  //
  // for (let dino of this.dinosaurs){
  //   if (dinosaurDiets[dino.diet]){
  //     dinosaurDiets[dino.diet] += 1;
  //   } else {
  //     dinosaurDiets[dino.diet] = 1;
  //   }
  // }
  //
  // return dinosaurDiets;
}

module.exports = Park;
