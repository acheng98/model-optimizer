import controlP5.*; 

ControlP5 cp5;

void makeMenu() {
  cp5 = new ControlP5(this);
  
  menuBackground();
  if (visMode == 0) {
  }
  if (visMode == 1) {
    voxelButtons();
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
    cp5.addButton(var.name)
      .setValue(0)
        .setPosition(width-menuWidth*7/10-menuWidth/8, height/12+height/30*i)
          .setSize(menuWidth/4, height/30-1)
            ;
    cp5.addButton(var.name+" ")
      .setValue(0)
        .setPosition(width-menuWidth*3/10-menuWidth/8, height/12+height/30*i)
          .setSize(menuWidth/4, height/30-1)
            ;
  }
}
