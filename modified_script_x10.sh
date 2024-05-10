#!/bin/bash
#PBS -l walltime=00:02:00
#PBS -l nodes=1:ppn=1
#PBS -N Martsevyi_integral
#PBS -t 1-350

cd $PBS_O_WORKDIR

input_file="input_table.txt"

if [ ! -f "$input_file" ]; then
    echo "Input file '$input_file' not found."
    exit 1
fi

line=$(sed -n "${PBS_ARRAYID}p" "$input_file")
read -r xmin xmax <<< "$line"

result=$(./integral_modified "$xmin" "$xmax")

if [ $? -ne 0 ]; then
    echo "Error occurred while running the program."
    exit 1
fi

output_file="solvOut_${PBS_ARRAYID}.out"

echo "$result" > "$output_file"

echo "Calculation completed successfully. Result written to '$output_file'."
