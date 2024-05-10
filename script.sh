#!/bin/bash
#PBS -l walltime=00:02:00
#PBS -l nodes=1:ppn=1
#PBS -N Martsevyi_integral
cd $PBS_O_WORKDIR/hpc
if [ ! -f $1 ]; then
    echo "Input file '$1' not found."
    exit 1
fi
read -r xmin xmax < "$1"
result=$(./integral_modified "$xmin" "$xmax")
if [ $? -ne 0 ]; then
    echo "Error occurred while running the program."
    exit 1
fi
output_file="$2"
echo $result > $output_file
echo "Calculation completed successfully. Result written to '$output_file'."
