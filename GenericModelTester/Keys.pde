int visMode = 0; //Visualization Modes: 0 for input data visualization, 1 for error visualization
int voxelMode = 0; //Voxel Vis Modes: 0 for both axis, 1 for x-axis, 2 for y-axis
boolean waitingX = false;
boolean waitingY = false;
boolean rotate = true;
int mouseYsaved = 0;
int mouseXsaved = 0; 
int mouseYclicked = 0;
int mouseXclicked = 0; 

void keyPressed() {
  switch(key) {
  case 'x':
    key_x();
    break;
  case 'y':
    key_y();
    break;
  case '1': 
    key_1();
    break;
  case '2': 
    key_2();
    break;
  case '3':
    key_3();
    break;
  case '4':
    key_4();
    break;
  case '5':
    key_5();
    break;
  case '6':
    key_6();
    break;
  case '+':
    key_plus();
    break;
  case '-':
    key_minus();
    break;
  case '/':
    key_slash();
    break;
  }
}

void mouseClicked() {
  if (mouseX < voxelPlotWidth && mouseY > 20) {
    mouseYclicked = mouseY;
    mouseXclicked = mouseX;
    rotate = !rotate;
  }
}

void mouseRotate() {
  if (mouseX < voxelPlotWidth && mouseY > 20) {
    mouseYsaved = mouseY;
    mouseXsaved = mouseX;
  }
}

void key_x() {
  waitingX = true;
}

void key_y() {
  waitingY = true;
}

void key_1() {
  if (varList.size() > 0) {
    if (waitingX == true) {
      if (voxelMode == 0 && vis2 == 0) {
        swapVis1Vis2();
      } else {
        vis1 = 0;
      }
      updateVoxel();
      waitingX = false;
    } else if (waitingY == true) {
      if (voxelMode == 0 && vis1 == 0) {
        swapVis1Vis2();
      } else {
        vis2 = 0;
      }
      waitingY = false;
    }
    updateVoxel();
  }
}

void key_2() {
  if (varList.size() > 1) {
    if (waitingX == true) {
      if (voxelMode == 0 && vis2 == 1) {
        swapVis1Vis2();
      } else {
        vis1 = 1;
      }
      waitingX = false;
    } else if (waitingY == true) {
      if (voxelMode == 0 && vis1 == 1) {
        swapVis1Vis2();
      } else {
        vis2 = 1;
      }
      waitingY = false;
    }
    updateVoxel();
  }
}

void key_3() {
  if (varList.size() > 2) {
    if (waitingX == true) {
      if (voxelMode == 0 && vis2 == 2) {
        swapVis1Vis2();
      } else {
        vis1 = 2;
      }
      waitingX = false;
    } else if (waitingY == true) {
      if (voxelMode == 0 && vis1 == 2) {
        swapVis1Vis2();
      } else {
        vis2 = 2;
      }
      waitingY = false;
    }
    updateVoxel();
  }
}

void key_4() {
  if (varList.size() > 3) {
    if (waitingX == true) {
      if (voxelMode == 0 && vis2 == 3) {
        swapVis1Vis2();
      } else {
        vis1 = 3;
      }
      waitingX = false;
    } else if (waitingY == true) {
      if (voxelMode == 0 && vis1 == 3) {
        swapVis1Vis2();
      } else {
        vis2 = 3;
      }
      waitingY = false;
    }
    updateVoxel();
  }
}

void key_5() {
  if (varList.size() > 4) {
    if (waitingX == true) {
      if (voxelMode == 0 && vis2 == 4) {
        swapVis1Vis2();
      } else {
        vis1 = 4;
      }
      waitingX = false;
    } else if (waitingY == true) {
      if (voxelMode == 0 && vis1 == 4) {
        swapVis1Vis2();
      } else {
        vis2 = 4;
      }
      waitingY = false;
    }
    updateVoxel();
  }
}

void key_6() {
  if (varList.size() > 5) {
    if (waitingX == true) {
      if (voxelMode == 0 && vis2 == 5) {
        swapVis1Vis2();
      } else {
        vis1 = 5;
      }
      waitingX = false;
    } else if (waitingY == true) {
      if (voxelMode == 0 && vis1 == 5) {
        swapVis1Vis2();
      } else {
        vis2 = 5;
      }
      waitingY = false;
    }
    updateVoxel();
  }
}

void key_plus() {
  if (visMode == 0) {
    visMode = 1;
    voxelMode = 0;
  } else { 
    if (voxelMode < 2) {
      voxelMode += 1;
    }
  }
  updateVoxel();
}

void key_minus() {
  if (voxelMode > 0) {
    visMode = 1; 
    voxelMode -= 1;
  } else {
    visMode = 0;
    voxelMode = 0;
  }
  updateVoxel();
}

void key_slash() {
  if (visMode == 0) {
    visMode = 1;
    voxelMode = 0;
    updateVoxel();
  } else if (visMode == 1 && voxelMode == 0) {
    visMode = 1;
    voxelMode = 1;
    updateVoxel();
  } else if (visMode == 1 && voxelMode == 1) {
    visMode = 1;
    voxelMode = 2;
    updateVoxel();
  } else if (visMode == 1 && voxelMode == 2) {
    visMode = 0;
  }
}

void swapVis1Vis2() {
  int temp = vis1;
  vis1 = vis2;
  vis2 = temp;
}
