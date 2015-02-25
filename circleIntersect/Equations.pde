int checkIntersect(float x0, float y0, float r0, float x1, float y1, float r1) {
  int doTheyIntersect;
  float dx, dy, d;
  
  //Calculating distance between centerpoints
  dx = x1 - x0;
  dy = y1 - y0;
  d = sqrt(sq(dy)+sq(dx)); 
  
  //Using distance to determine if they intersect
  if(d > (r0 + r1)) {
    //No intersection
    doTheyIntersect = 0;
  } else if (d < abs(r0 - r1)){
    //One is contained within the other
    doTheyIntersect = -1;
  } else {
    
    //They intersect
    doTheyIntersect = 1;
  }
  
  return doTheyIntersect;
}

float[] getIntersections(float x0, float y0, float r0, float x1, float y1, float r1) {
  float dx, dy, d, a, x2, y2, h, rx, ry, xi1, xi2, yi1, yi2;
  float[] intersectionPoints = new float[4];
  
  dx = x1 - x0;
  dy = y1 - y0;
  d = sqrt(sq(dy)+sq(dx));

  a = ((r0*r0) - (r1*r1) + (d*d)) / (2.0 * d);
  x2 = x0 + (dx * a/d);
  y2 = y0 + (dy * a/d);
  h = sqrt(sq(r0) - sq(a));
  rx = (0-dy) * (h/d);
  ry = dx * (h/d);
  xi1 = x2 + rx;
  xi2 = x2 - rx;
  yi1 = y2 + ry;
  yi2 = y2 - ry;
  
  intersectionPoints[0] = xi1;
  intersectionPoints[1] = yi1;
  intersectionPoints[2] = xi2;
  intersectionPoints[3] = yi2;
  
  return intersectionPoints;
}

float getArcAngle(PVector normal, PVector intersection) {
  float angle;
  
  angle = PVector.angleBetween(normal, intersection);
  
  if(intersection.y < 0){
    angle = TWO_PI - angle;
  }
  
  return angle;
}
