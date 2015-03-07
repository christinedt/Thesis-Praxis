BobSystem BobsUno;

void setup() {
  size(1000, 680);
  colorMode(HSB);
  frameRate(20);
  BobsUno = new BobSystem(2);
}

void draw() {
  background(0);
  BobsUno.runBobs();
}

