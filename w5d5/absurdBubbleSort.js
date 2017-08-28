const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function askIfGreaterThan(el1, el2, callback) {
  // Prompt user to tell us whether el1 > el2; pass true back to the
  // callback if true; else false.
  reader.question(
    "Is " + el1 + "greater than " + el2 + "?: ",
    function (answer) {
      if (answer == "yes") {
        callback(true);
      } else {
        callback(false);
      }
    }
  );
}

function innerBubbleSortLoop(arr, i, madeAnySwaps, outerBubbleSortLoop) {
  if (i == (arr.length - 1)) {
    outerBubbleSortLoop(madeAnySwaps);
    return;
  }

  askIfGreaterThan(arr[i], arr[i + 1], function (isGreaterThan) {
    if (isGreaterThan) {
      //perform a swap of elements
      const tmp = arr[i];
      arr[i] = arr[i + 1];
      arr[i + 1] = tmp;

      madeAnySwaps = true;
    }

    innerBubbleSortLoop(
      arr, i + 1, madeAnySwaps, outerBubbleSortLoop
    );
  });
}

function absurdBubbleSort(arr, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    // Begin an inner loop if `madeAnySwaps` is true, else call
    // `sortCompletionCallback`.
    if (madeAnySwaps) {
      innerBubbleSortLoop(arr, 0, false, outerBubbleSortLoop);
    } else {
      sortCompletionCallback(arr);
    }
  }

  // Kick the first outer loop off, starting `madeAnySwaps` as true.
  outerBubbleSortLoop(true);
}

absurdBubbleSort([3, 2, 1], function (arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});
