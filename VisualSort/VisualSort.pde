import java.util.ArrayList;
import java.util.List;

Sorter sorter = new Sorter();

void setup(){
  frameRate(30);
  size(2000,1000);
  textSize(16);
  sorter.randomizeArray(10, 10, false);
  //  for(int i = 0; i < 5; i++){
  //  System.out.println(sorter.toSort.get(i));
  //}
    sorter.drawAll();
}

void keyPressed(){
  if(key == ENTER){
    sorter.sorting = true; 
  }
  if(key == TAB && sorter.sortDisp == "bar"){
    sorter.sortDisp = "point"; 
  }
  else if(key == TAB && sorter.sortDisp == "point" && sorter.arraySize <= 100){
    sorter.sortDisp = "bar"; 
  }
  if(key == 'r'){ // r
    System.out.println("r");
    sorter.randomizeArray(10, 10, false); 
  }
}

void mouseWheel(MouseEvent event) { // changes framerate depending on scroll wheel
  sorter.changeFps(event.getCount());
}

void draw(){
  if(sorter.sorting == true){
  //sorter.countingSort();
  //sorter.bubbleSort();
  sorter.insertionSort();
  }
  //System.out.println(keyCode);
  sorter.drawAll();
}