void inputDataVis() {
  translate(width/2-menuWidth/2, height/2, 0);
  stroke(255); 
  fill(255); 
  textAlign(CENTER, CENTER);
  ellipseMode(CENTER);
  line(-(width-menuWidth-100)/2, 0, (width-menuWidth-100)/2, 0);
  line(0, -(height-100)/2, 0, (height-100)/2);

  //x-axis tick marks & labels
  for (int x = -12; x <= 12; x ++) {
    pushMatrix();
    translate((float)x/12*(width-menuWidth-150)/2, 0, 0);
    line(0, -5, 0, 5); 
    if (x == -12) {
      translate(0, 15, 0);
      text("-120", 0, 0);
    } else if (x == 12) {
      translate(0, 15, 0);
      text("120", 0, 0);
    }
    popMatrix();
  }

  //y-axis tick marks & labels
  for (int y = -6; y <= 6; y ++) {
    pushMatrix();
    translate(0, (float)y/6*(height-150)/2, 0);
    line(-5, 0, 5, 0); 
    if (y == -6) {
      translate(-15, 0, 0);
      text("30", 0, 0);
    } else if (y == 6) {
      translate(-15, 0, 0);
      text("-30", 0, 0);
    }
    popMatrix();
  }

  text("0", -5, 5); //label the origin
  noStroke();
  
  fill(255,0,0);
  for (int varX = -120*100; varX <= 120*100; varX ++) {
    float varY = model.evalModel((float)varX/100);
    float xCoord = map((float)varX/100, -120, 120, -(width-menuWidth-150)/2, (width-menuWidth-150)/2);
    float yCoord = map(varY, -30, 30, (height-150)/2, -(height-150)/2);
    if (varY > -35 && varY < 35) {
      rect(xCoord, yCoord, 1, 1);
    }
  }

  fill(255);
  for (float[] coord : inputData) {
    float xCoord = map(coord[0], -120, 120, -(width-menuWidth-150)/2, (width-menuWidth-150)/2);
    float yCoord = map(coord[1], -30, 30, (height-150)/2, -(height-150)/2);
    ellipse(xCoord, yCoord, 5, 5);
  }
}
