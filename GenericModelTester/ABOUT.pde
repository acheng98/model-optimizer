/*  Anthony Cheng, alcheng@mit.edu
 *
 *  ABOUT
 *  A script developed as a generalization of LightModelError, which in turn is an optimization  
 *  function for the light modeling applications FluxMap, written by Ira Winder, and IlluminanceMap,  
 *  by Anthony Cheng, Nina Lutz, and Neha Prasad
 *  This script creates an automated generalized model-optimization algorithm supporting models with
 *  six or fewer coefficients. 
 *
 *  USE CASES AND NOTES
 *  Use the Model tab to input your model and observed values to optimize the model to.
 *
 *  Need to make it abundantly clear that user needs to define reasonable range 
 *  VoxelPlot is only filter information 
 *
 *  FEATURE SCOPE
 *  [COMPLETE] 1. Variable Class - a class to contain variables representing coefficients of the model
 *  [COMPLETE] 2. Model Class - a class to evaluate the model equation and the error based on the variable coefficients inputted 
 *  [COMPLETE] 3. Dynamic Model Optimization - loops through all input variables and optimizes them to a local minimum
 *  [COMPLETE] 4. VoxelPlot - a visualization algorithm that plots 1D and 2D "voxels" of the error for the optimized variables
 *  [COMPLETE] 5. Example that tests multiple variables across a good range 
 *  [COMPLETE] 6. Buttons, Keys and Menu
 *  [INCOMPLETE] 7. View white initial state, light gray semitransparent possible solutions, green actual solution
 *
 *  BUG FIXES
 *  Something weird with the fit
 *  
 */
