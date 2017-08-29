import java.util.*;

//All global variables for the model are listed here
ArrayList<Variable> varList = new ArrayList<Variable>();
Model model = new Model(); 
ArrayList<float[]> errorList, filterErrorList;
float[] errorArray = {};
float[][] inputData; 
boolean precise = false; 
float gamma;
int vis1, vis2;
Table inputTable; // Data Handler(s) for Importing light Readings
int menuWidth = 250; 

void setup() {  

  size(1280, 768, P3D);
  varInput();
  initData();

  while (precise == false) {
    runCalculations();

    for (int i = 0; i < varList.size (); i++) {
      Variable var = varList.get(i);
      if (var.interval > var.precision) {
        if (var.interval*gamma < var.precision) {
          var.updateVariable(mRound(errorArray[i], var.precision), var.iter, var.precision);
        } else {
          var.updateVariable(mRound(errorArray[i], var.precision), var.iter, var.interval*gamma);
        }
      } else {
        var.updateVariable(mRound(errorArray[i], var.precision), var.iter, var.precision);
        var.fit = true;
      }
    }

    precise = true;
    for (Variable var : varList) {
      if (var.fit == false) {
        precise = false;
      }
    }
  }

  runCalculations();
  model.setVals(Arrays.copyOfRange(errorArray, 0, errorArray.length-1));
  println(errorArray);
  updateVoxel();
  
  makeMenu();
}

void draw() {
  background(0);
  
  menuBackground();
  
  pushMatrix();
  if (visMode == 0) {
    inputDataVis();
  } else if (visMode == 1) {
    if (voxelMode == 0) {
      drawVoxelPlot(vis1,vis2);
    } else if (voxelMode == 1) {
      drawVoxelPlot(vis1);
    } else if (voxelMode == 2) {
      drawVoxelPlot(vis2);
    }
  }
  popMatrix(); 
}

void runCalculations() {
  errorList = new ArrayList<float[]>();
  errorArray = new float[varList.size()+1];
  dataLoopFunction(varList, 0, errorArray);
  errorArray = getMinimumError();
}

void dataLoopFunction(ArrayList<Variable> varList, int level, float[] errorArray) {
  //varList is the list of variables
  //errorArray is the set of values, one retrieved per variable (length = number of variables), plus the error term at the end
  //level is the index of errorArray that we are on, which should always start at 0 

  if (level == varList.size()) { //terminating condition
    model.setVals(Arrays.copyOfRange(errorArray, 0, errorArray.length-1));
    errorArray[level] = model.error;
    errorList.add(Arrays.copyOf(errorArray, level+1));
  } else { //inductive condition
    Variable var = varList.get(level);
    for (int i = 0; i < var.testValues.length; i++) {
      errorArray[level] = var.testValues[i]; 
      dataLoopFunction(varList, level + 1, errorArray);
    }
  }
}

float[] getMinimumError() {
  float min = Float.POSITIVE_INFINITY;
  float[] minArray = {
  };
  for (float[] errorArray : errorList) {
    if (errorArray[errorArray.length - 1] < min) {
      min = errorArray[errorArray.length - 1];
      minArray = errorArray;
    }
  }
  return minArray;
}

float mRound(float value, float factor) {
  return Math.round(value / factor) * factor;
}

float fPow (float input, float power) {
  if (input < 0) {
    return -pow(-input, power);
  } else if (input == 0) {
    return 0;
  } else {
    return pow(input, power); 
  } 
}
