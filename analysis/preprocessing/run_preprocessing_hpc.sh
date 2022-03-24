#!/bin/bash
#SBATCH --job-name=219eeg
#SBATCH --output=log-%j.txt
#SBATCH --nodes=1
#SBATCH --ntasks=25
#SBACTH --ntasks-per-node=25
#SBATCH --partition=general
#SBATCH --time=99:00:00
#SBATCH --mail-type=END  	  # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=jdeleeuw@vassar.edu

cd ~/219-2022

srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-01-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-02-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-03-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-04-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-05-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-06-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-08-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-09-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-10-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-12-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-13-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-14-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-16-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-17-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-18-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-19-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-20-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-21-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-22-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-23-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-27-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-28-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-29-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-31-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &
srun --ntasks=1 Rscript preprocess_hpc.R /scratch/jdeleeuw/219-2022-eeg/raw/subject-32-eeg.bdf /scratch/jdeleeuw/219-2022-eeg/preprocessed &

wait