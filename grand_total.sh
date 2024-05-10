#!/bin/bash
#PBS -l walltime=00:02:00
#PBS -l nodes=1:ppn=1
#PBS -N Martsevyi_GrandTotal

cd $PBS_O_WORKDIR

output_file='GrandTotal.out'
total_sum=0
for file in solvOut_*.out; do
    sum=$(awk '{sum += $1} END {print sum}' "$file")
    total_sum=$(echo "$total_sum + $sum" | bc)
done
echo "Calculation completed successfully. Result written to '$output_file'."
printf "RESULT:\n$total_sum" > $output_file
