#!/bin/bash

#SBATCH -J lammps_mpi_32_nodes_48_procs
#SBATCH -o lammps.o%j
#SBATCH -e lammps.e%j
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

ibrun ../lammps/build/lmp -in ../lammps/bench/in.lj > $data/lammps_mpi_${SLURM_NTASKS}_baseline.txt
