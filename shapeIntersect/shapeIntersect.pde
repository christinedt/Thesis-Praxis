BobSystem BobsUno;

void setup() {
  size(600, 480);
  colorMode(HSB);
  frameRate(30);
  BobsUno = new BobSystem(2);
}

void draw() {
  background(255);
  BobsUno.runBobs();
}
