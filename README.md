# model-optimizer
By Anthony Cheng, alcheng@mit.edu

Written Summer/Fall 2017, with support from Ira Winder

Undergraduate Research Opportunity Program, Changing Places, MIT Media Lab

This work may be utilized following the Creative Commons License BY-SA 3.0. 

This is the same file as the "ABOUT.pde" file.

ABOUT
This package automates a generalized model-optimization algorithm supporting models wit six or fewer coefficients, and then provides visualizations of the input data, best guess, optimized model, and error of various guesses based on input search behavior.

REQUIREMENTS
This program is written in Processing 2.2.1 to ensure full support of all features. 
This program makes use of the package controlP5, as well as the standard Processing features. 
This program assumes some basic knowledge of Processing and Java, for it will be required to load user data and write the desired model equation. All functions that require user input are in the "UserInputTab" file.
Deeper knowledge of Processing is suggested when mutating the Input Data Visualization. Otherwise, nothing is explicitly necessary for the user to alter. 

USE CASES AND NOTES
Use the Model tab to input your model equation, observed values for optimization of the model, best guesses for the optimal values, and descent parameters.

Be careful of the value of gamma. Too low of a gamma value may result in a model that is not fully optimized; consider redefining the input value guesses.  
A model should be fully optimized if the minimum error (the black bar) is in the center of all visualizations in Tabs 2, 3, and 4. 
For Tabs 2, 3, and 4, clicking anywhere will "freeze" the rotation of the visualization; clicking again will "unfreeze" it. Switching between tabs will always "unfreeze" the rotation. Visualized variables still may be switched even when the rotation is frozen. 
The error is calculated as a squared error. 

TAB 1 (Input Data)
Visualizes the input data, the initial guess, and the optimized output
In the example provided, the model equation is of the form v_1 + v_2•e^{(v_3•v_input + v_4)^(1/3)}, where v_1 = -4; v_2 = 0.5; v_3 = 2.0; v_4 = -5.0. 
Check the file inputData.csv for the input values that are observed measurements based on those inputs. 
The example best guess for these coefficients is given as:
v_1 = -6; v_2 = 1; v_3 = 1; v_4 = 4.
This tab is handled by the InputDataVis.pde file, which the user can and should mutate to their modeling needs.  

TAB 2 (2 Variable Error Vis)
Takes two of the input variables and visualizes the error caused by their variation, holding all other variables at their optimized values
Buttons on the left column control the variable displayed on the x-axis, and the right column the y-axis. 
The same variable cannot be displayed on both axis (use tab 3 and tab 4 for that visualization). 

TAB 3 (X-Axis Error Vis)
Takes one of the input variables and visualizes the error caused by its variation along the x-axis, holding all 
other variables at their optimized values

TAB 4 (Y-Axis Error Vis) 
The same as Tab 3, but intsead of visualizing along the x-axis, a visualization along the y-axis.

For tabs 2, 3, and 4, the optimized value of the variables and the error at those optimized values is shown. 
The greater the error for the set of values at that combination of variables, the more red it will be. The less erroneous, the closer the color will be to white. 
  
FEATURE SCOPE
[COMPLETE] 1. Variable Class - a class to contain variables representing coefficients of the model
[COMPLETE] 2. Model Class - a class to evaluate the model equation and the error based on the variable coefficients inputted 
[COMPLETE] 3. Dynamic Model Optimization - loops through all input variables and optimizes them to a local minimum
[COMPLETE] 4. VoxelPlot - a visualization algorithm that plots 1D and 2D "voxels" of the error for the optimized variables
[COMPLETE] 5. Example that tests multiple variables across a good range 
[COMPLETE] 6. Buttons, Keys and Menu
[COMPLETE] 7. View white initial state, red actual solution
  
BUGS
When visualizing pairs of variables, sometimes it "freezes" one of the variables' box locations (but does switch around the axes)
