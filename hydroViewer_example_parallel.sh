#!/bin/bash

#SBATCH --job-name=hViewer
#SBATCH --time=1-0:00
#SBATCH -p sesempi
#SBATCH -N 2
#SBATCH -n 4
#SBATCH --mem-per-cpu=32G
#SBATCH --output=%j-hViewer.out
#SBATCH --error=%j-hViewer.err

# Uncomment the line below and modify
#cd "/path/to/hydroViewer/script/"

#imgFile: Path to decompressed data generated from read_binary_* script in UIOOPS.
#plotDirectory: Path to save image strips to file.
#campaign: Name of project (e.g., 'olympex'). Allows for project-specific conditional statements to be added to plotting routines.
#probeName: Probe type ('Fast2DC','2DS', 'HVPS', 'CIP', 'PIP'). Used to determine decryption routines specific to the manufacturer.
#annotate: 0 - Do not annotate every 5 particles in record; 1 - Annotate
#chunkSize: Number of image records (frames) to plot in succession
#chunkNum: nth chunk of frames to process for current job (e.g., chunkNum=2 plots frames chunkSize+1 to 2*chunkSize)

# Uncomment the lines below and modify
#srun -N 1 -n 1  python hydroViewer.py /path/to/UIOOPS/imageFile.nc /path/to/save/images/ socrates Fast2DC 0 20000 1 &
#srun -N 1 -n 1  python hydroViewer.py /path/to/UIOOPS/imageFile.nc /path/to/save/images/ socrates Fast2DC 0 20000 2 &
#srun -N 1 -n 1  python hydroViewer.py /path/to/UIOOPS/imageFile.nc /path/to/save/images/ socrates Fast2DC 0 20000 3 &
#srun -N 1 -n 1  python hydroViewer.py /path/to/UIOOPS/imageFile.nc /path/to/save/images/ socrates Fast2DC 0 20000 4
#wait