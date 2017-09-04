import controlP5.*; 

ControlP5 cp5;

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

void makeMenu() {
  menuBackground();

  if (visMode == 0) {
  }
  if (visMode == 1) {
  }
}

void menuBackground() {
  pushMatrix();
  translate(width - menuWidth/2, height/2, 0);
  rectMode(CENTER);
  fill(100);
  rect(0, 0, menuWidth, height);
  popMatrix();
}

void voxelButtons() {
  for (int i = 0; i < varList.size (); i++) {
    Variable var = varList.get(i);
    cp5.addButton("2XVar"+Integer.toString(i+1))
      .setValue(0)
        .setPosition(width-menuWidth*7/10-menuWidth/8, height/12+height/30*i)
          .setSize(menuWidth/4, height/30-1)
            .moveTo("2 Variable Error Vis")
              ;
    cp5.addButton("2YVar"+Integer.toString(i+1))
      .setValue(0)
        .setPosition(width-menuWidth*3/10-menuWidth/8, height/12+height/30*i)
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
    } else if (theControlEvent.getTab().getId() == 3) {
      visMode = 1;
      voxelMode = 1;
      updateVoxel();
    } else if (theControlEvent.getTab().getId() == 4) {
      visMode = 1;
      voxelMode = 2;
      updateVoxel();
    }
  } else {
    String[] name = theControlEvent.getController().getName().split("Var");
    if (name[0] == "2X") {
      key_x();
      buttonChangeVar(name);
    } else if (name[0] == "2Y") {
      key_y();
      buttonChangeVar(name);
    } else if (name[0] == "X") {
      key_x();
      buttonChangeVar(name);
    } else if (name[0] == "Y") {
      key_y();
      buttonChangeVar(name);
    }
  }
}

void buttonChangeVar(String[] name) {
  if (name[1] == "1") {
    key_1();
  } else if (name[1] == "2") {
    key_2();
  } else if (name[1] == "3") {
    key_3();
  } else if (name[1] == "4") {
    key_4();
  } else if (name[1] == "5") {
    key_5();
  } else if (name[1] == "6") {
    key_6();
  }
}
