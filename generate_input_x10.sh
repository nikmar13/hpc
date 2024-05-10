#!/bin/bash

xmin=-18460
xmax=96380
steps=350

dx=$(awk "BEGIN {print ($xmax - $xmin) / $steps}")
x=$xmin

for ((i=1; i<=$steps; i++))
do
    echo "$x $(echo "$x + $dx" | bc)"
    x=$(echo "$x + $dx" | bc)
done > input_table.txt
