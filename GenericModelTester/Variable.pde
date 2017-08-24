public class Variable {
  float midVal, interval, precision, initInterval;
  int iter, varID;
  String name;
  float[] testValues;
  boolean fit;

  Variable(float val, int iter, float interval, float precision, String name) {
    this.midVal = val;
    this.iter = iter;
    this.interval = interval;
    this.initInterval = interval; 
    this.precision = precision; 
    this.name = name; 
    this.testValues = createFloatIntervalArray(val, iter, interval);
    this.fit = false;
  }

  void updateVariable(float val, int iter, float interval) {
    this.midVal = val;
    this.iter = iter;
    this.interval = interval;
    this.testValues = createFloatIntervalArray(val, iter, interval);
  }
}

float[] createFloatIntervalArray(float midValue, int iter, float interval) {
  float arr[] = new float[iter];
  for (int i = 0; i < iter; i ++) {
    arr[i] = midValue - floor(iter/2)*interval + i*interval;
  }
  return arr;
} 

void addVariable(float midValue, int iter, float interval, float precision, String name) {
  Variable newVar = new Variable(midValue, iter, interval, precision, name);
  varList.add(newVar);
} 

void removeVariable(String name) {
  for (Variable var : varList) {
    if (var.name == name) { 
      varList.remove(var);
    }
  }
}

void removeVariable(int id) {
  for (Variable var : varList) {
    if (var.varID == id) {
      varList.remove(var);
    }
  }
}

void extractOneVarLoop(float[] errorMat, int index, int level) {
  if (level == errorMat.length - 1) {
    float[] newArray = {
      errorMat[index], errorMat[errorMat.length - 1]
    };
    filterErrorList.add(Arrays.copyOf(newArray, newArray.length)); 
    model.checkExtremes(errorMat[level]);
  } else {
    if (level == index) {
      extractOneVarLoop(errorMat, index, level + 1);
    } else {
      if (errorMat[level] == errorArray[level]) {
        extractOneVarLoop(errorMat, index, level + 1);
      }
    }
  }
}

void extractTwoVarLoop(float[] errorMat, int index1, int index2, int level) {
  if (level == errorMat.length - 1) {
    float[] newArray = {
      errorMat[index1], errorMat[index2], errorMat[errorMat.length - 1]
    };
    filterErrorList.add(Arrays.copyOf(newArray, newArray.length)); 
    model.checkExtremes(errorMat[level]);
  } else {
    if (level == index1 || level == index2) {
      extractTwoVarLoop(errorMat, index1, index2, level + 1);
    } else {
      if (errorMat[level] == errorArray[level]) {
        extractTwoVarLoop(errorMat, index1, index2, level + 1);
      }
    }
  }
}
