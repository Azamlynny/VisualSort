class Sorter{
  
  List<Integer> toSort = new ArrayList<Integer>();
  int arraySize;
  int fps = 30;
  float columnWidthRatio;
  float columnHeightRatio;
  String sortDisp = "bar";
  
  void randomizeArray(int size, Integer range, boolean inOrder){
    this.arraySize = size;
    if(inOrder == true){ //inOrder means that the array has no repeating numbers and no missing numbers (1,2,3)
      int swapIndex;
      List<Integer> pickNum = new ArrayList<Integer>();
      for(int i = 1; i <= size; i++){
        pickNum.add(i);
      }
      for(int i = 0; i < size; i++){
      swapIndex = ((int)random(pickNum.size()));
      toSort.add(pickNum.get(swapIndex));
      pickNum.remove(swapIndex);
      }
    }
    else{
      for(int i = 0; i < size; i++){
        toSort.add((Integer)((int)(random(range)+.5))); 
      }
    }
    
    this.columnWidthRatio = 2000/size;
    this.columnHeightRatio = 700/size;
  }
  
  void changeFps(float scrollWheelVal){
    if (scrollWheelVal == -1 && this.fps < 60){
      this.fps++;
      frameRate(this.fps);
    }
    else if (scrollWheelVal == 1 && this.fps > 1){
      this.fps--;
      frameRate(this.fps);
    }
  }
  
  void drawArray(){
    if(sortDisp == "bar"){
      for(int i = 0; i < this.arraySize; i++){
        fill(toSort.get(i) * 255/this.arraySize, 100, 200);
        rect(2000/arraySize * i, 1000, 2000 / arraySize, (( -toSort.get(i) * 600 / arraySize)));
      }
    }
  }
  
}