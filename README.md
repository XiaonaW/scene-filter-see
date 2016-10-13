## Scene-filter-see

This repository contains code for analyzing the relationship between scene image properties and perceptual judgments

# 1. Requirements
	
a). Software. Matlab is required to run the code. 

b). Location. No specific location is required for the project. We recommend using a location within the $MATLAB_PATH

c) Third party packages. Project contains all required third party packages inside /Scripts. All third party packages are licensed under Free to distribute GNU license. Description of external packages can be found in the Project description.doc document.

d). Source Images. Stereo images are required to run the code. Current version of the code contains images from Middlebury and Live3D datasets, obtained under free license. Copies of the images can be obtained from http://vision.middlebury.edu, or http://live.utaustin.edu.

e). Code modifications. Some modifications of the internal structure, particularly moving, renaming or deleting source image data in /Data folder, or renaming Matlab data files (*.mat* extension) might result in failure to run the main code or any of the sub-functions that rely on loading files with specific name or at specific location. We strongly advise to get familiar with the code prior making any structure modification. 

#2. Running the code.

To run the code, open Matlab, select the project’s directory in Matlab directory browser. Enter the scene-filter-see directory or expand the folder content, left-click on *main_RunAnalysis.m* and select “Run”.
	
Script can also be run from Matlab command line by typing *main_RunAnalysis.m*.
	Function main_DoAnalysis does not require any input arguments to run, however, it will require user input during the run. Function will set up location, load pre-computed results and provide the options currently available. Results will be saved in */Results* folder.
	Most of the folders will have a task-specific main function that can be run in the same manner. See the next section for more details.

# 3. Brief description of project’s structure.

Project consists of few distinctive parts, such as, image manipulation, image analysis, disparity model and 3d experiment. Folder structure in scene-filter-see root directory reflects different approaches and methods. The code responsible for running and generating results for each approach is placed in a designated folder.
Each folder has a Matlab file named *main{~}.m* inside it, that is the point-of entry function. This function does not require any arguments to run, but might depend on some other functions or pre-generated results. For example, the point-of-entry function inside *scene-filter-see/main_RunAnalysis.m* will first attempt to read pre-generated pyramid decomposition results, if they are not to be found, it will attempt to run the main script from *ImageAnalysis* to generate them. Accessory scripts used by files started with *main{}.m* are located in *Scripts subdirectories*. Any source data, such as EEG responses or image statistics is placed in *Data/* folder. Everything that is a result of given approach can be found inside the *Results* folder.
Below is the list of project’s root directories and briefly explain their structure and purpose.

* *3DExperiment* -- collection of tools for making 3D stimulus sets used by XDiva and for recovering subject’s responses. 
* *Scripts* -- collection of miscellaneous tools and external packages used by the project.
* *Data* -- the source location for stereo-images.
* *ImageAnalysis* -- tools for analyzing luminance-depth correlation and pyramid decomposition.
* *ImageManipulation* -- tools for image enhancement/degradation.
* *Models* -- contains the code for disparity model and complex RGC model.
* *main_RunAnalysis.m* --point-of-entry function, will all available types of analysis, based on user input.
* *Results* -- folder, where results, generated by main_DoAnalysis.m will be stored.



