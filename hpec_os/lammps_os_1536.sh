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
#export I_MPI_PIN_PROCESSOR_LIST=allcores
#export I_MPI_WAIT_MODE=0
#export I_MPI_THREAD_YIELD=3
#export I_MPI_THREAD_SLEEP=10

#LD_PRELOAD=./build/libtimelord_wrapper.so ibrun ../lammps/build/lmp -in ../lammps/bench/in.lj > $data/lammps_mpi_${SLURM_NTASKS}_large.txt

LD_PRELOAD=./build/libtimelord_wrapper.so mpirun --mca mpi_yield_when_idle true, mpi_warn_on_fork false, orte_base_help_aggregate false -np 1536 --oversubscribe ../lammps/build/lmp -in ../lammps/bench/in.lj > $data/lammps_os_test.txt
