# Sandpile Model
This repository is an implementation of Sandpile Model by [Per Bak](https://www.jasss.org/4/4/reviews/bak.html) in MATLAB. 


# Quick Start
To see the results you can run [`sandpile.m`](sandpile.m) file in MATLAB.

# How it works?
The sandpile is modeled as an `NxN` grid named `state`, which is randomly initialized with one, two, or three grains of sand. At each iteration, a random position within the grid is selected, and one grain of sand is added to it. If the number of grains in this cell exceeds the threshold of three, the cell is emptied (set to zero), and its contents are distributed to its neighboring cells in the up, down, left, and right directions. Note that distributions on the edges of the grid are ignored, as grains are assumed to fall off the table. The process of checking for exceeding the threshold and redistributing continues for each of the newly affected cells (children), until there is no further redistribution.

At the same time we record avalanches by another grid named `avalanche` of the same size. Everytime there is a distribution in `(x,y)` position we add 1 to the avalanche matrix.

This is how the grid will look like in the long run (in the beginign there is some time to reach the bigger avalanches)

![Demo](data/sandpile.gif)


Also we can record the avalanches through time:

![alt text](data/avalanches.gif)

If we only record the avalanches that are bigger than the previous ones we get this:

![alt text](data/bigger_avalanches.gif)


We also can confirm the power law distributoin:

![alt text](data/power_law.jpg)


# Video output
To record the video output you have to uncomment the associated parts in the [`sandpile.m`](sandpile.m) file


