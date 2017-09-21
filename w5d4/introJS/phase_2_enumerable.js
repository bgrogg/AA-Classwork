const NUMS = [1,2,3,4];

// Array#myEach

Array.prototype.myEach = function (func) {
  for (let i = 0; i < this.length; i++) {
    func(this[i]);
  }
};

NUMS.myEach((num) => {
  console.log(`square of ${num} is ${num * num}`)
});

// Array#myMap

Array.prototype.myMap = function (func) {
  const newArray = [];

  this.myEach(el => newArray.push(func(el)) );

  return newArray;
};

console.log(NUMS.myMap( num => num * num ));

// Array#myInject

Array.prototype.myInject = function (func, initialValue) {

  let arr = this;

  if (!initialValue) {
    initialValue = arr[0];
    arr = arr.slice(1);
  }

  let result = initialValue;

  arr.myEach(el => result = func(result, el));

  return result;
};

console.log(NUMS.myInject( (total, item) => total + item ));
