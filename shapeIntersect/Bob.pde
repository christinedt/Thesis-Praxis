class Bob {
  PVector position, velocity;
  int size, fieldSize, fieldIncrement, hue;
  float radius, fieldRadius;
  
  Bob() {
    hue = int(random(0, 255));
    size = 30;
    radius = size/2;
    fieldSize = 1500;
    fieldRadius = fieldSize/2;
    fieldIncrement = int(random(5, 20));
    int x = int(random(size/2, (width-size/2)));
    int y = int(random(size/2, (height-size/2)));
//    size = int(random(0, 50));
    position = new PVector(x, y);
    velocity = PVector.random2D();
  }
  
  void update() {
    position.add(velocity);
    
    //check for walls
    if((position.x - size/2) <= 0 || (position.x + size/2) >= width){ velocity.x *= -1; }
    if((position.y - size/2) <= 0 || (position.y + size/2) >= height){ velocity.y *= -1; }
  }
  
  void display() {
    renderBob();
  }
  
  void run(ArrayList<Bob> bills) {
    update();
    intersect(bills);
//    display();
  }
  
  void intersect(ArrayList<Bob> bills) {
    for(Bob other : bills) {
      float d = PVector.dist(position, other.position);
      PVector dVector = PVector.sub(other.position, position);
      
      if(d > 0){
        for(float i = fieldRadius; i > 0; i-=fieldIncrement) {
          for(float j = other.fieldRadius; j > 0; j-=other.fieldIncrement) {
            int areIntersecting = checkIntersect(position.x, 
                                                  position.y, 
                                                  i, 
                                                  other.position.x, 
                                                  other.position.y, 
                                                  j);
                                                  
            //If the fields are crossing and have intersection points
            if(areIntersecting == 1){
              float[] intersections = getIntersections(position.x, 
                                                      position.y, 
                                                      i, 
                                                      other.position.x, 
                                                      other.position.y, 
                                                      j);
              renderIntersectShape(intersections, dVector, i);
            }
            
            //If one of the fields is contained in the other
            if(areIntersecting == -1){
//              renderOverlapShape(i);
            }
          }
        }
      }
    }
  }
  
  void renderBob() {
    noStroke();
    fill(hue, 200, 200);
    ellipse(position.x, position.y, size, size);
  }
  
  void renderIntersectShape(float[] intersections, PVector distance, float tempSize) {
    PVector circleNormal = new PVector(radius, 0);
    PVector distIntA = new PVector(intersections[0], intersections[1]);
    PVector distIntB = new PVector(intersections[2], intersections[3]);
    float angle1, angle2;
    
    //Dots
    int dotSize = 1;
    noStroke();
    fill(hue, 200, 200, 200);
    ellipse(distIntA.x, distIntA.y, dotSize, dotSize);
    ellipse(distIntB.x, distIntB.y, dotSize, dotSize);
    
    //Arcs
    /*
    distIntA.sub(position);
    distIntB.sub(position);
    
    if(distance.x > 0){
      if(distIntA.y < distance.y){
        angle1 = getArcAngle(circleNormal, distIntA);
        angle2 = getArcAngle(circleNormal, distIntB);
      } else {
        angle1 = getArcAngle(circleNormal, distIntB);
        angle2 = getArcAngle(circleNormal, distIntA);
      }
      
      if((angle1 - PI) >  angle2){
        angle2 += TWO_PI;
      }
    } else {
      if(distIntA.y > distance.y){
        angle1 = getArcAngle(circleNormal, distIntA);
        angle2 = getArcAngle(circleNormal, distIntB);
      } else {
        angle1 = getArcAngle(circleNormal, distIntB);
        angle2 = getArcAngle(circleNormal, distIntA);
      }
      
      if((angle1 - PI) >  angle2){
        angle2 += TWO_PI;
      }
    }
    noFill();
    strokeWeight(2);
    stroke(0, 0, 0);
    arc(position.x, position.y, 2*tempSize, 2*tempSize, angle1, angle2, OPEN);
    */
    
  }
  
  void renderOverlapShape(float shapeSize){
    noFill();
    strokeWeight(2);
    stroke(0, 0, 0);
    ellipse(position.x, position.y, 2*shapeSize, 2*shapeSize);
  }
  
  void renderField() {
    stroke(100, 50);
    noFill();
    for(int i = 0; i < fieldSize; i+=20){
      ellipse(position.x, position.y, i, i);
    }
  }
}
