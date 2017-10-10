void varInput() {
  /*  The order that you add variables will be the order in which the keys correspond to differing visualizations
   *  The order is also exactly how the variables will correspond to the general internal variables, e.g. 
   *  the first variable added corresponds to var1 
   *  Maximum number of variables supported by default is six
   *  
   *  addVariable(value, iterations, interval, precision, name)
   *
   *  Value (float): The best initial guess for the value of this variable
   *  Iterations (int): The number of test values per variable. Use an odd number for optimal visualization.
   *  Interval (float): The initial "distance" between the intervals at which the model will be tested at.
   *  Precision (float): The precision at which the value will be calculated to.
   *  Name (string): A string with the name of the variable
   */
  addVariable(0, 10, 4, 0.1, "g1"); //Actual Value: -4.0
  addVariable(0, 10, 0.5, 0.1, "g2"); //Actual Value: 0.5 
  addVariable(0, 10, 2, 0.1, "g3"); //Actual Value: 2.0
  addVariable(0, 10, 2, 0.1, "g4"); //Actual value: -5.0

  gamma = 0.90; // descent coefficient - the higher the descent coefficient, the longer the time it will take, but the more accurate the fit will be 

  //input your data here
  inputTable = loadTable("inputData.csv", "header");
}

void initData() {
  //initialize your data here as needed
  inputData = new float[inputTable.getRowCount()][2];
  for (int i = 0; i < inputTable.getRowCount (); i++) {
    inputData[i][0] = inputTable.getFloat(i, "x");
    inputData[i][1] = inputTable.getFloat(i, "y");
  }
}

class Model {
  void evalModelError() {
    error = 0; 
    for (int i = 0; i < inputData.length; i++ ) {
      float inputVal = inputData[i][0];
      float actVal = inputData[i][1];

      prediction = evalModel(inputVal); //evaluate the model given input data
      error += pow(actVal - prediction, 2); //evaluate the error, in this case with least squares
    }
  }

  //input your model here, with "result" as the numerical output of the input parameters of your model 
  //var1 through var6 are variables that you can use as coefficients in your model. Don't "skip" variables
  //e.g. don't use var5 if you aren't using var3 or var4. 
  float evalModel(float inputVal) {
    return var1 + var2*exp(fPow((var3*inputVal + var4), 1.0/3));
  }

  /*********************/
  //Don't touch the parts between the asteriks, which initialize the model class
  float var1, var2, var3, var4, var5, var6, prediction, error, maxValue, minValue; 

  Model() {
    init();
  }

  Model(float[] valSet) { 
    //adjust variables as necessary
    //these variables are the default values if variables aren't added to be tested
    init();
    setVals(valSet);
  }

  void init() {
    error = 0;
    maxValue = -1;  
    minValue = Float.POSITIVE_INFINITY;
  }

  void setVals(float[] valSet) {
    for (int i = 0; i < valSet.length; i ++ ) {
      if (i == 0) {
        this.var1 = valSet[i];
      } else if (i == 1) {
        this.var2 = valSet[i];
      } else if (i == 2) {
        this.var3 = valSet[i];
      } else if (i == 3) {
        this.var4 = valSet[i];
      } else if (i == 4) {
        this.var5 = valSet[i];
      } else if (i == 5) {
        this.var6 = valSet[i];
      }
    }
    evalModelError();
  }

  void checkExtremes(float value) {
    if (value > maxValue) {
      maxValue = value;
    }
    if (value < minValue) {
      minValue = value;
    }
  }
  
  float[] returnVariables() {
    float[] arr = {var1,var2,var3,var4,var5,var6};
    return arr;
  }
  
  /*********************/
}
