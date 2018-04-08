import java.util.ArrayList;
import java.util.List;
import java.util.Collections;
String input = "";
int sortSize = 10;

Sorter sorter = new Sorter();

void setup(){
  frameRate(30);
  size(2000,1000);
  textSize(16);
  noStroke();
  sorter.randomizeArray(10, 10, false);
  //  for(int i = 0; i < 5; i++){
  //  System.out.println(sorter.toSort.get(i));
  //}
    sorter.drawAll();
}

void keyPressed(){
  if(key == ENTER && sorter.sorting == false){
    sorter.sorting = true; 
    sorter.reset();
  }
  else if(key == ENTER && sorter.sorting == true){
    sorter.sorting = false;
  }
  if(key == TAB && sorter.sortDisp == "bar"){
    sorter.sortDisp = "point"; 
  }
  else if(key == TAB && sorter.sortDisp == "point" && sorter.arraySize <= 100){
    sorter.sortDisp = "bar"; 
  }
  if(key == 'r'){ // 
    sorter.randomizeArray(sortSize, sortSize, false);
    sorter.sorting = false;
  }
  
  input = input + key;
  try{
    sortSize = Integer.parseInt(input);
  }
  catch(NumberFormatException nfe){ 
  }
  
  if(key == BACKSPACE){
   input = ""; 
  }
  
  if(key == ' ' && sorter.sorting == false){
    if(sorter.sortStyle == "bubble"){
      sorter.sortStyle = "counting";
    }
    else if(sorter.sortStyle == "counting"){
      sorter.sortStyle = "bogo";
    }
    else if(sorter.sortStyle == "bogo"){
      sorter.sortStyle = "bubble";
    }
  }
}

void mouseWheel(MouseEvent event) { // changes framerate depending on scroll wheel
  sorter.changeFps(event.getCount());
}

void draw(){
  if(sorter.sorting == true){
    if(sorter.sortStyle == "bubble"){
      sorter.bubbleSort(); 
    }
    else if(sorter.sortStyle == "insertion"){
      sorter.insertionSort(); 
    }
    else if(sorter.sortStyle == "counting"){
      sorter.countingSort(); 
    }
    else if(sorter.sortStyle == "bogo"){
      sorter.bogoSort(); 
    }
  }
  //System.out.println(keyCode);
  sorter.drawAll();
}