import java.util.ArrayList;
import java.util.List;

Sorter sorter = new Sorter();

void setup(){
  frameRate(30);
  size(2000,1000);
  textSize(16);
  sorter.randomizeArray(50, 50, false);
  //  for(int i = 0; i < 5; i++){
  //  System.out.println(sorter.toSort.get(i));
  //}
    sorter.drawAll();
}

void keyPressed(){

}

void mouseWheel(MouseEvent event) { // changes framerate depending on scroll wheel
  sorter.changeFps(event.getCount());
}

void draw(){
  sorter.drawAll();
  sorter.countingSort();
  //sorter.bubbleSort();
  sorter.drawAll();
}