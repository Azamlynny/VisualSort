class Sorter{
  List<Integer> toSort = new ArrayList<Integer>();
  Integer arraySize;
  
  void randomizeArray(Integer size, Integer range, boolean inOrder){
    if(inOrder == true){
      int swapIndex;
      this.arraySize = size;
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
  }
  
}