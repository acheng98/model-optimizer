int visMode = 0; //Visualization Modes: 0 for input data visualization, 1 for error visualization
int voxelMode = 0; //Voxel Vis Modes: 0 for both axis, 1 for x-axis, 2 for y-axis
boolean waitingX = false;
boolean waitingY = false;

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

void key_x() {
  waitingX = true;
}

void key_y() {
  waitingY = true;
}

void key_1() {
  if (waitingX == true) {
    vis1 = 0;
    updateVoxel();
    waitingX = false;
  } else if (waitingY == true) {
    vis2 = 0;
    updateVoxel();
    waitingY = false;
  }
}

void key_2() {
  if (waitingX == true) {
    vis1 = 1;
    updateVoxel();
    waitingX = false;
  } else if (waitingY == true) {
    vis2 = 1;
    updateVoxel();
    waitingY = false;
  }
}

void key_3() {
  if (waitingX == true) {
    vis1 = 2;
    updateVoxel();
    waitingX = false;
  } else if (waitingY == true) {
    vis2 = 2;
    updateVoxel();
    waitingY = false;
  }
}

void key_4() {
  if (waitingX == true) {
    vis1 = 3;
    updateVoxel();
    waitingX = false;
    println(vis1);
  } else if (waitingY == true) {
    vis2 = 3;
    updateVoxel();
    waitingY = false;
  }
}

void key_5() {
  if (waitingX == true) {
    vis1 = 4;
    updateVoxel();
    waitingX = false;
  } else if (waitingY == true) {
    vis2 = 4;
    updateVoxel();
    waitingY = false;
  }
}

void key_6() {
  if (waitingX == true) {
    vis1 = 5;
    updateVoxel();
    waitingX = false;
  } else if (waitingY == true) {
    vis2 = 5;
    updateVoxel();
    waitingY = false;
  }
}

void key_plus() {
  if (voxelMode < 2) {
    voxelMode += 1;
    updateVoxel();
  }
}

void key_minus() {
  if (voxelMode > 0) {
    voxelMode += -1;
    updateVoxel();
  }
}

void key_slash() {
  if (visMode == 0) {
    visMode = 1;
    updateVoxel();
  } else if (visMode == 1) {
    visMode = 0;
  }
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
