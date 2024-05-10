#!/bin/bash

xmin=-1846
xmax=9638
steps=35

dx=$(awk "BEGIN {print ($xmax - $xmin) / $steps}")
x=$xmin

for ((i=1; i<=$steps; i++))
do
    echo "$x $(echo "$x + $dx" | bc)"
    x=$(echo "$x + $dx" | bc)
done > input_table.txt
