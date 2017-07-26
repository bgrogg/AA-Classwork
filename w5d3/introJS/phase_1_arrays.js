// Array.prototype.uniq

Array.prototype.uniq = function() {
  let uniqueArray = [];

  for (let i = 0; i < this.length; i++) {
    if (uniqueArray.indexOf(this[i]) === -1) {
      uniqueArray.push(this[i]);
    }
  }

  return uniqueArray;
};

console.log([2, 2, 3, 4, 4, 5].uniq());

// Array.prototype.twoSum

Array.prototype.twoSum = function() {
  let pairs = [];
  const indexHash = {};

  this.forEach((el, idx) => {
    if (indexHash[el * -1]) {
      const newPairs = indexHash[el * -1].map((prevIdx) => [prevIdx, idx]);

      pairs = pairs.concat(newPairs);
    }

    indexHash[el] ? indexHash[el].push(idx) : indexHash[el] = [idx];
  });

  return pairs;
};

console.log([-1, 0, 2, -2, 1].twoSum());


// Array#transpose

Array.prototype.transpose = function() {
  const columns = Array.from(
    { length: this[0].length },
    () => Array.from({ length: this.length })
  );

  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this[i].length; j++) {
      columns[j][i] = this[i][j];
    }
  }

  return columns;
}

console.log([[0, 1, 2], [3, 4, 5], [6, 7, 8]].transpose());
