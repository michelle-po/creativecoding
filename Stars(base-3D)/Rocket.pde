class Rocket {

  PShape rocket;
  PImage texture;
 

  float x;
  float y;
  float vx=random(-10, 10);
  float vy=random(-10, 10);

  Rocket(float cx, float cy) {
    x=cx;
    y=cy;

    this.rocket = loadShape("rocket.obj");;
   // this.rocket.disableStyle();

    texture=loadImage("rocket.jpg");
  }

  void display() {

    pushMatrix();
    //lights();
    translate(x, y);
    this.rocket.setTexture(this.texture);
    noStroke();
    shape(this.rocket);
    popMatrix();

    x+=vx;
    y+=vy;

    if (x>width+200 || x<0)vx*=-1;
    if (y>height+200 || y<0)vy*=-1;
  }

}//END
