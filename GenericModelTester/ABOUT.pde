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
 *  Use the Model tab to input your model equation and observed values to optimize the model to.
 *
 *  Be careful of the value of gamma. Too low of a gamma value may result in a model that is not fully optimized;
 *  consider redefining the input value guesses.  
 *  A model should be fully optimized if the minimum error (the black bar) is in the center of all visualizations.
 *
 *  Tab 1 (Input Data)
 *  Visualizes the input data, the initial guess, and the optimized output
 *  In the example provided, the model equation is of the form v_1 + v_2•e^{(v_3•v_input + v_4)^(1/3)}, where
 *  v_1 = -4; v_2 = 0.5; v_3 = 2.0; v_4 = -5.0. 
 *  Check the file inputData.csv for the input values that are observed measurements based on those inputs. 
 *  The example best guess for these coefficients is given as:
 *  v_1 = -6; v_2 = 1; v_3 = 1; v_4 = 4.
 *  This tab is handled by the InputDataVis.pde file, which the user can and should mutate to their modeling needs.  
 *
 *  Tab 2 (2 Variable Error Vis)
 *  Takes two of the input variables and visualizes the error caused by their variation, holding all other variables 
 *  at their optimized values
 *  Buttons on the left column control the variable displayed on the x-axis, and the right column the y-axis. 
 *  The same variable cannot be displayed on both axis (use tab 3 and tab 4 for that visualization). 
 *
 *  Tab 3 (X-Axis Error Vis)
 *  Takes one of the input variables and visualizes the error caused by its variation along the x-axis, holding all 
 *  other variables at their optimized values
 *
 *  Tab 4 (Y-Axis Error Vis) 
 *  The same as Tab 3, but intsead of visualizing along the x-axis, a visualization along the y-axis.
 *
 *  For tabs 2, 3, and 4, the optimized value of the variables and the error at those optimized values is shown. 
 *
 *  FEATURE SCOPE
 *  [COMPLETE] 1. Variable Class - a class to contain variables representing coefficients of the model
 *  [COMPLETE] 2. Model Class - a class to evaluate the model equation and the error based on the variable coefficients inputted 
 *  [COMPLETE] 3. Dynamic Model Optimization - loops through all input variables and optimizes them to a local minimum
 *  [COMPLETE] 4. VoxelPlot - a visualization algorithm that plots 1D and 2D "voxels" of the error for the optimized variables
 *  [COMPLETE] 5. Example that tests multiple variables across a good range 
 *  [COMPLETE] 6. Buttons, Keys and Menu
 *  [COMPLETE] 7. View white initial state, red actual solution
 *  
 */
