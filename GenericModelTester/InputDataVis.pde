void inputDataVis() {
  translate(width/2-menuWidth/2, height/2, 0);
  stroke(255); 
  fill(255); 
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
      text("30", -15, 0);
    } else if (y == 6) {
      text("-30", -15, 0);
    }
    popMatrix();
  }

  text("0", -10, 10); //label the origin
  noStroke();

  for (int varX = -120*100; varX <= 120*100; varX ++) {
    float xCoord = map((float)varX/100, -120, 120, -(width-menuWidth-150)/2, (width-menuWidth-150)/2);

    fill(255);
    float varYinit = initModel.evalModel((float)varX/100); 
    float yCoordInit = map(varYinit, -30, 30, (height-150)/2, -(height-150)/2);
    if (varYinit > -35 && varYinit < 35) {
      rect(xCoord, yCoordInit, 1, 1);
    }

//    fill(155, 100);
//    for (Model intermModel : modelSnapshots) { 
//      float varYinterm = initModel.intermModel((float)varX/100); 
//      float yCoordInterm = map(varYinterm, -30, 30, (height-150)/2, -(height-150)/2);
//      if (varYinterm > -35 && varYinterm < 35) {
//        rect(xCoord, yCoordInterm, 1, 1);
//      }
//    }

    fill(255, 0, 0);
    float varY = iterModel.evalModel((float)varX/100);
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
