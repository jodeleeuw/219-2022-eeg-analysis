#!/bin/bash
#SBATCH --job-name=219eeg
#SBATCH --output=log-%j.txt
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBACTH --ntasks-per-node=1
#SBATCH --partition=general
#SBATCH --time=99:00:00
#SBATCH --mail-type=END  	  # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=jdeleeuw@vassar.edu

cd ~/219-2022

srun Rscript merge_files_hpc.R