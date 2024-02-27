#!/bin/bash

#SBATCH -J minife_mpi_32_nodes_48_procs
#SBATCH -o minife.o%j
#SBATCH -e minife.e%j
#SBATCH -A TG-PEB220004
#SBATCH -p skx-normal
#SBATCH -N 32
#SBATCH --ntasks-per-node=48
#SBATCH -t 01:00:00


# module load gcc/7.1.0
# module load mkl/18.0.2

data="./timelord_results"
export OMP_NUM_THREADS=1
export I_MPI_WAIT_MODE=0

(time LD_PRELOAD=./build/libtimelord_wrapper.so ibrun ../miniFE/mkl/src/miniFE.x -nx 60 -ny 60 -nz 60) > $data/minife_mpi_${SLURM_NTASKS}_baseline_ew.txt 2>&1
