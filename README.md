# HydroViewer
Python package for displaying OAP images and particle properties.

HydroViewer is a Python package useful in displaying particle images from a variety of optical array probes (OAPs). The most stable version of the code will be on the GitHub repository, but the developer cannot guarantee that bugs do not exist. If you have a bug to report, send an email to finlon2@illinois.edu. The code will be updated over time with new user features, with such additions listed in the What’s New and Version History sections below.

Also included in this document is a brief overview of the features and how to run the software using files processed through the University of Illinois OAP Processing Software (UIOPS). The package includes 2 programs to display particle images: (1) HydroViewer for plotting to file 6 image records simultaneously in the background, and (2) HydroViewer2 for interactively plotting an image record and displaying particle properties for user-selected hydrometeors.

## What's New

### SelectHydroViewer
Version 1.0

### HydroViewer2
-	Added an image mode (imageMode=1) to display rejected particles (using 'image\_auto\_reject') in red --> The ability exists to make the conditions of this rejection flexible, including addition of an inter-arrival threshold value
-	Improved binary representation of image data to use integer formats (now works with Python 3.x)
-	Moved input parameters towards beginning of the script and cleaned up some statements
-	Allows reading of particle data files that don't have rectangular/elliptical morphological parameters

### HydroViewer
Version 1.0

## Features

### SelectHydroViewer
-	Builds image buffers from particles meeting user-specified criteria
-	Images outputted as pixel-for-pixel representation to preserve quality
-	Particles optionally restricted by start/end time, size, reject status, inter-arrival time, and habit

### HydroViewer2
-	Displays one image record at a time with buttons to toggle through the file
-	Particle properties (e.g., maximum dimension, area, perimeter) shown after clicking on a particle within the image record
-	Ability to save images of user-selected particles

### HydroViewer
-	Displays 6 image records at once
-	Automated saving of images for all image records in a file
-	Information on the frame number, time, and number of particles for each image record
-	Option to overlay an asterisk every 5 particles (helpful when associating images to the particle-by-particle data

## SelectHydroViewer Instructions
SelectHydroViewer is designed to output image buffers, one at a time, that are built from user-specified criteria such as time and numerous particle properties. If very few restrictions are placed on which particles get plotted, please use HydroViewer instead (which supports parallel execution).

The program has the following Python package dependencies: numpy, scipy, xarray

SelectHydroViewer is called using the following arguments (\* denotes required):
-	imageFile\*: path to decompressed data generated from read\_binary\_\* script in UIOPS
-	particleFile\*: path to particle-by-particle data generated from imgProc_sm script
-	plotDirectory\*: path to save image strips to file
-	campaign\*: name of project (e.g., 'olympex'); allows for project-specific conditional statements to be added to plotting routines
-	probeName\*: probe type ('2DS', 'HVPS', 'CIP', 'PIP'); used in determining image decryption methods specific to the manufacturer
-	startTime: flight time (HHMMSS) to begin the plotting job
-	endTime: flight time (HHMMSS) to end the plotting job
-	rejStatus: array of rejection status values (from image\_auto\_reject variable) of which to plot particles; see script comments on lines 245-247 for available values
-	minD: minimum particle size (mm) of which to plot particles
-	maxD: maximum particle size (mm) of which to plot particles
-	intArrThresh: minimum inter-arrival time (s) of which to plot particles
-	habitStatus: array of habit type to use in particle plotting; see script comments on lines 256-257 for available values

For help on running SelectHydroViewer in the background, follow the runSelectHydroViewer.sh script.

## HydroViewer Instructions

HydroViewer is designed to process 60,000 image records at a time. Processing more than this can have adverse effects such as excessive memory utilization. Because of this, it’s recommended to first check the number of frames in the image file and determine how many calls to the HydroViewer program are required for the flight.

The program has the following Python package dependencies: numpy, matplotlib, xarray, glob

HydroViewer is called using the following arguments:
-	campaign: string variable (e.g., ‘olympex’)
-	date: string variable in yyyymmdd format (e.g., ‘20151112’)
-	probeName: string variable [options – ‘2DS’, ‘HVPS’]
-	imageMode: 0 - all particles shaded black
-	annotate: 0 - no annotations ; 1 - a red asterisk is overlaid every 5 particles
- chunkNum: nth chunk (of 60,000 image records) to process within the file
-	inFile: file path to the decompressed image file (ouput data from the read\_binary\_\*.m script)

The program is initiated with the following commands:
\>> from hydroViewer import get\_slice\_endpoints, buffer\_integrity, image\_buffer, annotate\_particle\incriments, initialize\_inputs;
\>> initialize\_inputs(campaign, date, probeName, imageMode, annotate, chunkNum, inFile)

If all 60,000 frames are to be processed, it is recommended to run HydroViewer with 32 GB of memory allocated to one processor.

## HydroViewer2 Instructions

HydroViewer2 is designed to run within Jupyter notebook for the purpose of displaying particles from a single image record and allow the user to view particle properties for a user-selected particle.

The program has the following Python package dependencies: numpy, scipy, matplotlib, xarray, glob

HydroViewer2 is run by following the steps below:
1.	Run the first cell block in the program (package import block)
2.	In the second cell block, modify the campaign, date, probe name, annotation value (0: off; 1: on), image mode (0: all particles in black; 1: rejected particles in red), frame number to begin plotting, the path to the decompressed image file, and the path to the particle-by-particle data file. Run this cell.
3.	Run cell blocks 2-5 as well. Matplotlib should display an interactive plot which enables the capability to toggle between image records and register user clicks over a particle of interest. If desired: press the ‘Previous’ and ‘Next’ buttons to backtrack or advance one frame at a time through the data.
4.	With the desired frame displayed and the cell block highlighted, hover your cursor over a particle of interest and click within that region. The program records the position within the plot for later use. You may also notice that the cursor position in the lower right portion of the figure is displayed as you navigate around the image record.
5.	Run the sixth cell block. After a few seconds, particle properties for the selected particle will be displayed immediately below the cell.
6.	In the seventh cell block, change the directory path as desired for the outFile variable. Separate images are saved to the specified directory depending on the probe used and the particle’s time, frame number, and particle number. Run this cell. The image (*.png) should appear in the specified folder. The pixel dimensions will be nDiodes x nSlices so that each pixel corresponds to a single pixel shadowed by the OAP.

## Known Bugs

### HydroViewer
-	Frame number in image filenames and frame numbers displayed above the image records do not directly correspond to the image record in the particle-by-particle data files (i.e., frame #1 corresponds to the second record number in the particle-by-particle data file)

### HydroViewer2
-	When browsing through CIP/PIP image data using the previous/next buttons, the image record occasionally does not update --clicking the button again refreshes the display for an additional frame backward/forward

## Version History

### SelectHydroViewer
Version 1.0
-	Initial code release

### HydroViewer2
Version 2.2
-	Added an image mode (imageMode=1) to display rejected particles (using 'image\_auto\_reject') in red --> The ability exists to make the conditions of this rejection flexible, including addition of an inter-arrival threshold value
-	Improved binary representation of image data to use integer formats (now works with Python 3.x)
-	Moved input parameters towards beginning of the script and cleaned up some statements
-	Allows reading of particle data files that don't have rectangular/elliptical morphological parameters

Version 2.1
-	Added support for DMT probes (e.g., CIP, PIP)

Version 2.0
-	Initial code release

### HydroViewer
Version 1.0
-	Initial code release