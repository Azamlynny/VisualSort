import java.util.ArrayList;
import java.util.List;

Sorter sorter = new Sorter();

void setup(){
  frameRate(30);
  size(2000,1000);
  sorter.randomizeArray(100, 100, false);
  //  for(int i = 0; i < 100; i++){
  //  System.out.println(sorter.toSort.get(i));
  //}
}

void keyPressed(){

}

void mouseWheel(MouseEvent event) { // changes framerate depending on scroll wheel
  sorter.changeFps(event.getCount());
}

void draw(){
  background(0);
  sorter.drawArray();
}