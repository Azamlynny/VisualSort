import java.util.ArrayList;
import java.util.List;

Sorter sorter = new Sorter();

void setup(){
  sorter.randomizeArray(100, 100, true);
  //  for(int i = 0; i < 100; i++){
  //  System.out.println(sorter.toSort.get(i));
  //}
}

void keyPressed(){
  sorter.randomizeArray(100, 100, true);
}

void draw(){

}