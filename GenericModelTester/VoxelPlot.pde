//Global Error Visualization Coefficients
float backgroundOpacity = 200; 
float cubePixels = 300; //width of full voxel cube in pixels
float zAxisInterval = 20; 
float axesLabelOffset = 30;
int printI = 0;
int voxelPlotWidth;

float iterX, iterY;
float varXSpace, varYSpace; 
float zTrans = -cubePixels/2;

//Three types of VoxelPlot types: (voxelMode)
//0. Two variables displayed along X & Y axes
//1. One variable displayed along X axis
//2. One variable displayed along Y axis

void VoxelPlotX(int index) {
  voxelMode = 1; 
  filterErrorList = new ArrayList<float[]>();
  Variable var = varList.get(index);
  iterX = var.iter; 
  iterY = 1; 
  varXSpace = cubePixels/iterX;
  varYSpace = varXSpace;
  model.init();
  for (float[] errorMat : errorList) {
    extractOneVarLoop(errorMat, index, 0);
  }
}

void VoxelPlotY(int index) {
  voxelMode = 2; 
  filterErrorList = new ArrayList<float[]>();
  Variable var = varList.get(index);
  iterX = 1;
  iterY = var.iter;
  varYSpace = cubePixels/iterY;
  varXSpace = varYSpace;
  model.init();
  for (float[] errorMat : errorList) {
    extractOneVarLoop(errorMat, index, 0);
  }
}

void VoxelPlot(int index1, int index2) {
  voxelMode = 0; 
  filterErrorList = new ArrayList<float[]>();
  Variable var1 = varList.get(index1);
  Variable var2 = varList.get(index2); 
  iterX = var1.iter;
  iterY = var2.iter;

  varXSpace = cubePixels/var1.iter;
  varYSpace = cubePixels/var2.iter; 
  model.init();

  for (float[] errorMat : errorList) {
    extractTwoVarLoop(errorMat, index1, index2, 0);
  }
}

void drawVoxelPlot(int index) {
  initVoxelPlot();
  Variable var = varList.get(index); 
  for (int x=0; x < iterX; x++) {
    for (int y=0; y < iterY; y++) {
      float[] errorMat = filterErrorList.get((int)(x*iterY+y));
      float value = errorMat[errorMat.length - 1];
      fill(255, 255, 255 - map(value, model.minValue, model.maxValue, 50, 200.0));

      //At the miniminum value, make voxel stand out and print out a statement (once) 
      //of minimum value and the optimized variables/values
      if (value == model.minValue) {
        fill(100);
        float var1Val = errorMat[0];
        if (printI == 0) {
          println("MinValue:", model.minValue + ",", var.name + ":", var1Val);
          printI ++;
        }
      }
      drawBox(x, y, value);
    }
  }

  drawVoxelAxes(var, var);
}

void drawVoxelPlot(int index1, int index2) {
  initVoxelPlot();
  Variable var1 = varList.get(index1);
  Variable var2 = varList.get(index2);
  for (int x=0; x < iterX; x++) {
    for (int y=0; y < iterY; y++) {
      //println("try",x,y,filterErrorList.size());
      float[] errorMat = filterErrorList.get((int)(x*iterY+y));
      float value = errorMat[errorMat.length - 1];
      fill(255, 255, 255 - map(value, model.minValue, model.maxValue, 50, 200.0));

      //At the miniminum value, make voxel stand out and print out a statement (once) 
      //of minimum value and the optimized variables/values
      if (value == model.minValue) {
        fill(100);
        if (printI == 0) {
          println("MinValue:", model.minValue + ",", var1.name + ":", errorMat[0] + ",", var2.name + ":", errorMat[1]);
          printI ++;
        }
      }

      drawBox(x, y, value);
    }
  }

  drawVoxelAxes(var1, var2);
}

void initVoxelPlot() {
  lights(); //turn on the lights so that we see shading on the 3D objects
  voxelPlotWidth = width - menuWidth;
  translate(voxelPlotWidth/2, height/2); //move to the center of the sketch before we draw our graph
  rotateX(map(mouseY, -width*2, 0, 0, TWO_PI));
  rotateZ(map(mouseX, 0, width, 0, TWO_PI));
}

void drawBox(int x, int y, float value) {
  float xTrans = (x-floor(iterX/2))*varXSpace;
  float yTrans = (y-floor(iterY/2))*varYSpace;
  float zBoxHeight = value*pow(model.maxValue, -1)*cubePixels;

  pushMatrix();
  if (voxelMode == 1) {
    translate(xTrans, 0, zTrans + zBoxHeight/2); //moves the voxels to the correct 3d coordinate
  } else if (voxelMode == 2) {
    translate(0, yTrans, zTrans + zBoxHeight/2); //moves the voxels to the correct 3d coordinate
  } else if (voxelMode == 0) {
    translate(xTrans, yTrans, zTrans + zBoxHeight/2); //moves the voxels to the correct 3d coordinate
  }
  box(varXSpace-1, varYSpace-1, zBoxHeight);
  popMatrix();
}

void drawVoxelAxes(Variable var1, Variable var2) {
  pushMatrix();
  translate(-cubePixels/2, -cubePixels/2, -cubePixels/2);
  textAlign(CENTER, CENTER);
  fill(255);
  drawXAxis(var1);
  drawYAxis(var2);
  drawZAxis(var1, var2);
  popMatrix();
}

void drawXAxis(Variable var) {
  stroke(255);
  strokeWeight(4);
  pushMatrix();
  if (voxelMode == 1) {
    translate(0, cubePixels/2-varXSpace/2, 0);
    line(0, 0, 0, cubePixels*11/10, 0, 0);
    xLabel(var);
  } else if (voxelMode == 2) {
    translate(cubePixels/2-varXSpace/2, 0, 0);
    line(0, 0, 0, varXSpace*11/10, 0, 0);
  } else if (voxelMode == 0) {
    line(0, 0, 0, cubePixels*11/10, 0, 0);
    xLabel(var);
  } 
  popMatrix();
  noStroke();
}

void drawYAxis(Variable var) {
  stroke(255);
  strokeWeight(4);
  pushMatrix();
  if (voxelMode == 1) {
    translate(0, cubePixels/2-varYSpace/2, 0);
    line(0, 0, 0, 0, varYSpace*11/10, 0);
  } else if (voxelMode == 2) {
    translate(cubePixels/2-varYSpace/2, 0, 0);
    line(0, 0, 0, 0, cubePixels*11/10, 0);
    yLabel(var);
  } else if (voxelMode == 0) {
    line(0, 0, 0, 0, cubePixels*11/10, 0);
    yLabel(var);
  } 
  popMatrix();
  noStroke();
}

void drawZAxis(Variable var1, Variable var2) {
  stroke(255);
  strokeWeight(4);
  pushMatrix();
  if (voxelMode == 1) {
    translate(0, cubePixels/2-varXSpace/2, 0);
  } else if (voxelMode == 2) {
    translate(cubePixels/2-varYSpace/2, 0, 0);
  } 
  line(0, 0, 0, 0, 0, cubePixels*11/10);
  zLabel(var1, var2);
  popMatrix();
  noStroke();
}

void xLabel(Variable var) {
  pushMatrix();
  textSize(12);
  rotateZ(PI/2);
  for (int x = 0; x < var.iter; x++) {
    text(var.testValues[x], -axesLabelOffset, -cubePixels/var.iter*(x+0.5), 0);
  }
  textSize(18);
  text(var.name, -axesLabelOffset/2, -cubePixels*12/10, 0);
  popMatrix();
}

void yLabel(Variable var) {
  pushMatrix();
  textSize(12);
  rotateZ(PI);
  for (int y = 0; y < var.iter; y++) {
    text(var.testValues[y], axesLabelOffset, -cubePixels/var.iter*(y+0.5), 0);
  }
  textSize(18);
  text(var.name, axesLabelOffset/2, -cubePixels*12/10, 0);
  popMatrix();
}

void zLabel(Variable var1, Variable var2) {
  float zInt;
  if (var1.iter < var2.iter) {
    zInt = var1.iter;
  } else {
    zInt = var2.iter;
  }

  pushMatrix();
  rotateX(3*PI/2);
  rotateY(5*PI/4);
  textSize(12);
  for (int z = 0; z < zInt + 1; z++) {
    text(map(z, 0, zInt, 0, model.maxValue), 0, -cubePixels/zInt*(z), axesLabelOffset);
  }
  textSize(18);
  text("Error", axesLabelOffset/2, -cubePixels*11/10, axesLabelOffset);
  popMatrix();
}

void updateVoxel() {
  if (voxelMode == 1) {
    VoxelPlotX(vis1);
  } else if (voxelMode == 2) {
    VoxelPlotY(vis2);
  } else if (voxelMode == 0) {
    VoxelPlot(vis1, vis2);
  }
}
