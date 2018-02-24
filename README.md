# Progress

_Command line progress indicators for MATLAB_

Progress is a small MATLAB package for displaying textual progress indicators in loops for MATLAB.

![](progress_bar.gif)

## Usage

Progress supports the following types of indicators:

- progress.Bar - for known total iterations
- progress.Spinner - for unknown total iterations

## progress.Bar

A progress bar is intended for loops with a known total number of iterations, for example a for loop. Create a `progress.Bar` object passing in a display message and the total number of iterations. On each loop iterations call the object's `update` method.

```matlab
nSteps = 200;
p = progress.Bar('Running a long calculation', nSteps);

for iCalc = 1:nSteps
    doSomeStuff();
    p.update();
end
```

## progress.Spinner

A spinner (or throbber) is intended for loops of unknown length, for example while loops. To create a `progress.Spinner` object pass in a display message, and again call the `update` method to increment the progress indicator. To indicate completion of the loop call the `finish` method.

```matlab
p = progress.Spinner('Running a different long calculation');

for iCalc = 1:100
    doSomeStuff();
    p.update();
end
p.finish();
```

## Options

TODO


## TODO 

- tests
- doumentation
- nested loops
- minimum refresh time
- save statistics?
- some weird bug after clc on iteration 27 with spinner...