import java.util.ArrayList;
import processing.sound.*;
import java.util.List;
import java.util.Collections;
String input = "";
int sortSize = 10;
Pulse pulse;

Sorter sorter = new Sorter();

void setup(){
  frameRate(30);
 pulse = new Pulse(this);
  
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
    if(sorter.soundQueue == true){
      pulse.play();
    }
  }
  else if(key == ENTER && sorter.sorting == true){
    sorter.sorting = false;
    pulse.stop();
  }
  if(key == TAB && sorter.sortDisp == "bar"){
    sorter.sortDisp = "point"; 
  }
  else if(key == TAB && sorter.sortDisp == "point"){
    sorter.sortDisp = "circle"; 
  }
  else if(key == TAB && sorter.sortDisp == "circle"){
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
      sorter.sortStyle = "gnome";
    }
    else if(sorter.sortStyle == "gnome"){
      sorter.sortStyle = "bubble"; 
    }
  }
  
  if(key == 's' && sorter.playingSound == false){
    
    if(sorter.soundQueue == false && sorter.sorting == false){
       sorter.soundQueue = true;
    }
    else if(sorter.sorting == true){
     pulse.play();
     sorter.soundQueue = true;
    }
    sorter.playingSound = true;
    
  }
  else if(key == 's' && sorter.playingSound == true)
  {
    pulse.stop();
    sorter.playingSound = false;
    sorter.soundQueue = false;
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
    else if(sorter.sortStyle == "gnome")
    {
      sorter.gnomeSort(); 
    }
  }
  //System.out.println(keyCode);
  sorter.drawAll();
}