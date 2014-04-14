//------------------------------------------------------------------------------------------------------------------
// YOUR CODE: Create your Zoo "object literal" and Animal "constructor" and "prototypes" here.
//------------------------------------------------------------------------------------------------------------------
function Animal(type, numLegs){
  this.name = type;
  this.numLegs = numLegs;
}

Animal.prototype.identify = function() {
  if (this.name === "Human") {
    return ("I am a Human with 2 legs.")
  }
}

var Zoo = { animals: [],
            bipeds: function(){
                      var bipedArray = [];
                      for (var i = 0; i < this.animals.length; i++) {
                        if (animals[i].numLegs === 2) {
                          bipedArray.push(this.animals[i]);
                        }
                      }
                      return bipedArray;
                    },
            quadrupeds: function(){
                      var quadArray = [];
                      for (var i =  0; i < this.animals.length; i++) {
                        if (animals[i].numLegs === 4) {
                          quadArray.push(this.animals[i]);
                        }
                      }
                      return quadArray
                    },
        


            init: function(intake){
                    for (var i = 0; i < intake.length; i++) {
                      this.animals.push(intake[i])
                    }
                  }
          } 



//------------------------------------------------------------------------------------------------------------------
// DRIVER CODE: Do **NOT** change anything below this point. Your task is to implement code above to make this work.
//------------------------------------------------------------------------------------------------------------------

function assert(test, message) {  
  if (!test) {
    throw "ERROR: " + message;
  }
  return true;
}

var animals = [
  new Animal("Human", 2),
  new Animal("Monkey", 2),
  new Animal("Kangaroo", 2),
  new Animal("Horse", 4),
  new Animal("Cow", 4),
  new Animal("Centipede", 100)
];

Zoo.init(animals);


assert(
  Zoo.bipeds().length === 3, "the Zoo should have 3 bipeds"
);
assert(
  Zoo.quadrupeds().length === 2, "the Zoo should have 2 quadrupeds"
);
assert(
  animals[0].identify() === "I am a Human with 2 legs.", "humans have 2 legs"
);

console.log(animals[2])
assert(
  animals[2].name === "Kangaroo", "expected 'Kangaroo'"
);
assert(
  animals[0].identify === animals[5].identify, "only one implementation of the identify() function should exist"
);

console.log("All tests passed");
