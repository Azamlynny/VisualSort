class Sorter {

  List<Integer> toSort = new ArrayList<Integer>();
  int arraySize;
  int fps = 30;
  float columnWidthRatio;
  float columnHeightRatio;
  String sortDisp = "bar";
  String sortStyle = "bubble";
  int arrayAccess = 0;
  int comparisons = 0;
  float angleRatio;
  int correct; // number of correct numbers in order
  int currentPlace = 0;
  int solved;
  boolean soundQueue = false;
  int index;
  boolean sorting = false;
  int dataRange;
  boolean reading = true;
  int scan = 0;
  boolean playingSound = false;
  List<Integer> countArray = new ArrayList<Integer>();
List<Integer> pickNum = new ArrayList<Integer>();
  
  void randomizeArray(int size, Integer range, boolean inOrder) {
    this.reset();
    this.toSort.clear();
    this.arraySize = size;
    if(inOrder == true) { //inOrder means that the array has no repeating numbers and no missing numbers (1,2,3)
      int swapIndex;
      this.pickNum.clear();
      for(int i = 1; i <= size; i++) {
        this.pickNum.add(i);
      }
      for(int i = 0; i < size; i++) {
        swapIndex = ((int)random(pickNum.size()));
        toSort.add(pickNum.get(swapIndex));
        this.pickNum.remove(swapIndex);
      }
    }
    else{
      for(int i = 0; i < size; i++) {
        toSort.add((Integer)((int)(random(range-1)+1.5)));
      }
    }
    this.columnWidthRatio = 2000/size;
    this.columnHeightRatio = 700/size;
    this.solved = size;
    this.dataRange = range;
    this.angleRatio = 360 / this.arraySize;
    
  }
  
  void finishSort(){
    pulse.stop();
    this.sorting = false;
  }
  
  void changeFps(float scrollWheelVal) {
    if (scrollWheelVal == -1 && this.fps < 60) {
      this.fps++;
      frameRate(this.fps);
    } else if (scrollWheelVal == 1 && this.fps > 1) {
      this.fps--;
      frameRate(this.fps);
    }
  }

  void drawArray(){
    pulse.freq(((int) 1000 / (this.currentPlace + 1)) + 150);
    

    if (sortDisp == "bar") {
      for (int i = 0; i < this.arraySize; i++) {
        fill(toSort.get(i) * 255/this.arraySize, 100, 200);
        if(i == this.currentPlace){
          fill(50, 255, 28);
        }
        rect(i * this.columnWidthRatio, 1000, this.columnWidthRatio, -this.toSort.get(i) * this.columnHeightRatio);
      }
    }
    else if(sortDisp == "point"){
     for (int i = 0; i < this.arraySize; i++) {
        fill(toSort.get(i) * 255/this.arraySize, 100, 200);
        if(i == this.currentPlace){
          fill(50, 255, 28);
        }
        rect(i * this.columnWidthRatio, 1000 - this.columnHeightRatio * this.toSort.get(i), this.columnWidthRatio, this.columnHeightRatio);
      }
    }
    else if(sortDisp == "circle"){
       for (int i = 0; i < this.arraySize; i++) {
          if(i < this.arraySize / 2){
            fill(255);
          }
          else if(i > this.arraySize / 2){
            fill(0);
          }
          
         arc(1000, 600, 1000, 700, radians(this.angleRatio * i), radians(this.angleRatio * i + this.angleRatio));
       }
       
    }
    
  }

  void drawGUI(){
    fill(255);
    text("Framerate: " + this.fps, 1800, 25);
    text("Average FPS: " + frameRate, 1800, 50);
    text("Comparisons: " + this.comparisons, 25, 25);
    text("Array Accesses: " + this.arrayAccess, 25, 50);
    text(this.sortStyle, 1000,75);
  }

  void drawAll(){
    background(0);
    this.drawArray();
    this.drawGUI(); 
  }
  
  void swap(int placeX, int placeY){
    this.toSort.set(placeX, this.toSort.get(placeX) ^ this.toSort.get(placeY));
    this.toSort.set(placeY, this.toSort.get(placeY) ^ this.toSort.get(placeX));
    this.toSort.set(placeX, this.toSort.get(placeX) ^ this.toSort.get(placeY));
    this.arrayAccess += 3;
  }
  
  void reset(){
    this.correct = 0;
    this.currentPlace = 0;
    this.scan = 0;
    this.index = 0;
    this.arrayAccess = 0;
    this.comparisons = 0;
    this.reading = true;
    this.countArray.clear();
    for(int i = 0; i < this.arraySize; i++){
      this.countArray.add(0);
    }
  }
  
  void bubbleSort(){
        if(this.toSort.get(this.currentPlace) > this.toSort.get(this.currentPlace+1)){
          this.comparisons++;
          this.swap(this.currentPlace, this.currentPlace + 1);
          //this.toSort.set(this.currentPlace, this.toSort.get(this.currentPlace) ^ this.toSort.get(this.currentPlace+1));
          //this.toSort.set(this.currentPlace+1, this.toSort.get(this.currentPlace+1) ^ this.toSort.get(this.currentPlace));
          //this.toSort.set(this.currentPlace, this.toSort.get(this.currentPlace) ^ this.toSort.get(this.currentPlace+1));
          this.correct = 1;
        }
        else{
          this.comparisons++; 
          this.correct++;
        }
        if(this.correct == this.arraySize){          
          finishSort();
        }
        this.currentPlace++;
        if(this.currentPlace >= this.arraySize-1 || this.currentPlace >= this.solved){
          this.currentPlace = 0; 
          this.solved--;
          this.correct = this.arraySize - this.solved;
        }
  }


  void countingSort(){
    
    if(this.reading == true && this.sorting == true){ //works
      //System.out.println(this.toSort.get(this.currentPlace));
      this.countArray.set(this.toSort.get(currentPlace) - 1, this.countArray.get(this.toSort.get(currentPlace)-1)+1);
      this.arrayAccess++;
      this.currentPlace++;
    }
    
    if(this.currentPlace >= this.arraySize && this.reading == true){
      this.reading = false; 
      this.currentPlace = 0;
    }
    
    if(this.currentPlace >= this.arraySize && this.reading == false){
      finishSort();
      this.currentPlace = 0;
      this.scan = 0;
    }
     // [5, 0, 2, 3]
    if(this.reading == false && this.sorting == true){ //<>//
      if(this.countArray.get(this.scan) != 0){
         for(int i = 0; i < this.countArray.get(this.scan); i++){
           this.toSort.set(this.currentPlace, this.scan + 1);
           this.arrayAccess++;
           this.currentPlace++;
         }
         this.scan++;
      }
      else{
        this.scan++;
      }
    }
  }
  
  void insertionSort(){

    this.index = this.correct + 1;
    
    if(this.index >= this.arraySize){
      finishSort();
      this.index = 0;
    }
    //for(int i = this.index; i > 
    while(true){
      if(this.index == 0){
         break; 
       } 
       
      if(this.toSort.get(this.index - 1) > this.toSort.get(this.index)){
         this.index--;
       }
       else{
         break; 
       }
       
    }
    if(this.sorting == true){
      this.toSort.add(this.index, toSort.get(this.correct + 1));
      this.toSort.remove(this.correct + 2);
      this.currentPlace++;
      this.correct++;
    }
  }
  
  void bogoSort(){
   Collections.shuffle(toSort); 
   this.arrayAccess += this.arraySize;
     for(int i = 0; i < this.arraySize - 1; i++){
       if(this.toSort.get(i) <= this.toSort.get(i+1)){
         this.correct++; 
       }
     }
     if(this.correct >= this.arraySize - 1){
       finishSort(); 
       this.correct = 0;
     }
     else{
      this.correct = 0; 
     }
  }
  
  void gnomeSort(){
    if(this.currentPlace <= 0){
      this.index++;
      this.currentPlace = this.index;
    }
    
    if(this.index >= this.arraySize){
      this.finishSort();
    }
    if(this.sorting == true){
      if(this.toSort.get(this.currentPlace) < this.toSort.get(this.currentPlace - 1)){
        this.swap(this.currentPlace, this.currentPlace - 1);
        this.currentPlace--;
      }
      else{
        this.currentPlace = 0; 
      }
      this.comparisons++;
    }
  }
  
}