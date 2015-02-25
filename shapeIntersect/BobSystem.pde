class BobSystem {
  ArrayList<Bob> bobs;
  int bobAmount;
  
  BobSystem(int bobNumber) {
    bobs = new ArrayList<Bob>();
    bobAmount = bobNumber;
    
    for(int i = 0; i < bobAmount; i++){
      bobs.add(new Bob());
    }
  }
  
  void runBobs() {
    for(Bob b : bobs){
      b.run(bobs);
    }
  }
}
