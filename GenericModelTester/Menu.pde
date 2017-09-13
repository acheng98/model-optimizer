import controlP5.*; 

ControlP5 cp5;
int menuWidth = 250; 
int legendHeight = 150;
int legendWidth = menuWidth*4/5;

void makeMenu() {
  menuBackground();

  pushMatrix();
  translate(width-menuWidth, 0, 0);
  fill(255);
  textSize(16);
  if (visMode == 0) {
    menuZero();
  } else if (visMode == 1) {
    if (voxelMode == 0) {
      menuOne();
    } else if (voxelMode == 1) {
      menuTwo();
    } else if (voxelMode == 2) {
      menuThree();
    }
  }
  popMatrix();
}

void menuBackground() {
  pushMatrix();
  int bevel = 15;
  translate(width - menuWidth/2, height/2, 0);
  fill(255, 100);
  stroke(255, 150);
  strokeWeight(1);
  rect(0, 0, menuWidth-2*bevel, height-2*bevel, bevel);
  popMatrix();
}

void menuZero() {
  text("Equation:", menuWidth/2, 45);
  image(equationImage, menuWidth/2, 100, menuWidth*4/5, menuWidth*4/5*equationImage.height/equationImage.width);
  
  //Legend
  pushMatrix();
  translate(menuWidth/2, height-menuWidth/2);
  
  fill(255,0); stroke(255); strokeWeight(2);
  rect(0,0,legendWidth,legendHeight);
  
  fill(255); noStroke();
  text("Legend:", 0, -25-menuWidth*3/10);
  
  textAlign(LEFT,CENTER);
  text("Original\nGuess", -legendWidth/16, -legendHeight/5);
  stroke(255); strokeWeight(4);
  line(-legendWidth*3/8,-legendHeight/5,-legendWidth/8,-legendHeight/5);
  
  text("Optimized\nValues", -legendWidth/16, legendHeight/5);
  stroke(255,0,0); strokeWeight(4);
  line(-legendWidth*3/8,legendHeight/5,-legendWidth/8,legendHeight/5);
  
  textAlign(CENTER,CENTER); strokeWeight(1);
  noStroke();
  popMatrix();
}

void menuOne() {
  text("X-axis\nVariables:", menuWidth*3/10, 45);
  text("Y-axis\nVariables:", menuWidth*7/10, 45);
}

void menuTwo() {
  text("X-axis Variables:", menuWidth/2, 45);
}

void menuThree() {
  text("Y-axis Variables:", menuWidth/2, 45);
}

void makeTabs() {
  cp5 = new ControlP5(this);

  cp5.getTab("default").hide();
  cp5.addTab("Input Data")
    .setColorBackground(color(0, 160, 100))
      .setColorLabel(color(255))
        .setColorActive(color(255, 128, 0))
          ;
  cp5.addTab("2 Variable Error Vis")
    .setColorBackground(color(0, 160, 100))
      .setColorLabel(color(255))
        .setColorActive(color(255, 128, 0))
          ;
  cp5.addTab("X-Axis Error Vis")
    .setColorBackground(color(0, 160, 100))
      .setColorLabel(color(255))
        .setColorActive(color(255, 128, 0))
          ;
  cp5.addTab("Y-Axis Error Vis")
    .setColorBackground(color(0, 160, 100))
      .setColorLabel(color(255))
        .setColorActive(color(255, 128, 0))
          ;

  cp5.getTab("Input Data")
    .activateEvent(true)
      .setId(1)
        ;
  cp5.getTab("2 Variable Error Vis")
    .activateEvent(true)
      .setId(2)
        ;
  cp5.getTab("X-Axis Error Vis")
    .activateEvent(true)
      .setId(3)
        ;
  cp5.getTab("Y-Axis Error Vis")
    .activateEvent(true)
      .setId(4)
        ;
}

void voxelButtons() {
  for (int i = 0; i < varList.size (); i++) {
    Variable var = varList.get(i);
    cp5.addButton("2XVar"+Integer.toString(i+1))
      .setValue(0)
        .setPosition(width-menuWidth*7/10-menuWidth/8, 15+height/12+height/30*i)
          .setSize(menuWidth/4, height/30-1)
            .moveTo("2 Variable Error Vis")
              ;
    cp5.addButton("2YVar"+Integer.toString(i+1))
      .setValue(0)
        .setPosition(width-menuWidth*3/10-menuWidth/8, 15+height/12+height/30*i)
          .setSize(menuWidth/4, height/30-1)
            .moveTo("2 Variable Error Vis")
              ;
    cp5.addButton("XVar"+Integer.toString(i+1))
      .setValue(0)
        .setPosition(width-menuWidth*5/10-menuWidth/8, height/12+height/30*i)
          .setSize(menuWidth/4, height/30-1)
            .moveTo("X-Axis Error Vis")
              ;
    cp5.addButton("YVar"+Integer.toString(i+1))
      .setValue(0)
        .setPosition(width-menuWidth*5/10-menuWidth/8, height/12+height/30*i)
          .setSize(menuWidth/4, height/30-1)
            .moveTo("Y-Axis Error Vis")
              ;
  }
}

void controlEvent(ControlEvent theControlEvent) {
  if (theControlEvent.isTab()) {
    if (theControlEvent.getTab().getId() == 1) {
      visMode = 0;
    } else if (theControlEvent.getTab().getId() == 2) {
      visMode = 1;
      voxelMode = 0;
      updateVoxel();
      rotate = true;
    } else if (theControlEvent.getTab().getId() == 3) {
      visMode = 1;
      voxelMode = 1;
      updateVoxel();
      rotate = true;
    } else if (theControlEvent.getTab().getId() == 4) {
      visMode = 1;
      voxelMode = 2;
      updateVoxel();
      rotate = true;
    }
  } else if (theControlEvent.getController() instanceof controlP5.Button) {
    String[] name = theControlEvent.getController().getName().split("Var");
    if (name[0].equals("2X")) {
      key_x();
      buttonChangeVar(name);
    } else if (name[0].equals("2Y")) {
      key_y();
      buttonChangeVar(name);
    } else if (name[0].equals("X")) {
      key_x();
      buttonChangeVar(name);
    } else if (name[0].equals("Y")) {
      key_y();
      buttonChangeVar(name);
    }
  }
}

void buttonChangeVar(String[] name) {
  if (name[1].equals("1")) {
    key_1();
  } else if (name[1].equals("2")) {
    key_2();
  } else if (name[1].equals("3")) {
    key_3();
  } else if (name[1].equals("4")) {
    key_4();
  } else if (name[1].equals("5")) {
    key_5();
  } else if (name[1].equals("6")) {
    key_6();
  }
}
