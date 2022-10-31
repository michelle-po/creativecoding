class Planet {

  PShape sphere;
  PShape sphereEye;

  PImage texture;
  PImage textureEye;

  float distanceX;
  float positionY;

  float ry=random(0, 0.04);
  float rmoon= 0.2;
  int taille;

  float vitesse;

  String noms;
  PImage block;
  PImage pizza;


  Planet(String _noms, float _distance, int _taille, float _vitesse) {

    this.taille=_taille;
    this.sphere = loadShape(_noms+".obj");
    //this.sphere.disableStyle();
    this.texture = loadImage(_noms+".jpg");
    this.distanceX = _distance;
    this.vitesse=_vitesse;
    this.noms=_noms;

    ////eye
    this.textureEye = loadImage("eye.jpg");
    this.sphereEye = createShape(SPHERE, this.taille);
    this.sphereEye.disableStyle();

    //RUBIK
    block = loadImage("block.png");
    textureMode(NORMAL);

    //PIZZA
    pizza = loadImage("pizza.png");
    textureMode(NORMAL);
  }

  float x, y, z;

  void display() {

    pushMatrix();
    stroke(255, 50);
    noFill();
    rotateX(PI/2);
    circle(0, 0, this.distanceX*2);
    popMatrix();

    pushMatrix();
    lights();
    //translate(width/2, 0);
    rotateY(this.vitesse);
    translate(this.distanceX, 0, 0);
    rotateY(this.ry);
    
   //this.sphere.setTexture(this.texture);
    noStroke();
    //Camera position
    x = modelX(0, 0, 0);
    y = modelY(0, 0, 0);
    z = modelZ(0, 0, 0);
    
    scale(this.taille);
    rotateX(PI/2);
    shape(this.sphere);
    this.vitesse+=0.001;
    ry+=0.002;

    //rubik
    if (this.noms=="rubik") {
      pushMatrix();
      rotateY(this.ry);
      scale(5);
      TexturedCube(block);
      popMatrix();
    }

    //eye
    if (this.noms=="eye") {
      pushMatrix();
      rotateY(this.ry);
      this.sphereEye.setTexture(this.textureEye);
      shape(this.sphereEye);
      popMatrix();
    }


    //pizza
    if (this.noms=="pizza") {
      pushMatrix();
      rotateY(this.ry);
      scale(0.008);
      imageMode(CENTER);
      image(pizza, 0, 0);
      popMatrix();
    }

    popMatrix();
  }


  float [] actualPosition() {
    float [] pos = {0, 0, 0};
    pos[0]=x;
    pos[1]=y;
    pos[2]=z;
    return pos;
  }
}

void TexturedCube(PImage block) {
  beginShape(QUADS);
  texture(block);

  // +Z "front" face
  vertex(-1, -1, 1, 0, 0);
  vertex( 1, -1, 1, 1, 0);
  vertex( 1, 1, 1, 1, 1);
  vertex(-1, 1, 1, 0, 1);

  // -Z "back" face
  vertex( 1, -1, -1, 0, 0);
  vertex(-1, -1, -1, 1, 0);
  vertex(-1, 1, -1, 1, 1);
  vertex( 1, 1, -1, 0, 1);

  // +X "right" face
  vertex( 1, -1, 1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, 1, -1, 1, 1);
  vertex( 1, 1, 1, 0, 1);

  // -X "left" face
  vertex(-1, -1, -1, 0, 0);
  vertex(-1, -1, 1, 1, 0);
  vertex(-1, 1, 1, 1, 1);
  vertex(-1, 1, -1, 0, 1);

  // +Y "bottom" face
  vertex(-1, 1, 1, 0, 0);
  vertex( 1, 1, 1, 1, 0);
  vertex( 1, 1, -1, 1, 1);
  vertex(-1, 1, -1, 0, 1);

  // -Y "top" face
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, -1, 1, 1, 1);
  vertex(-1, -1, 1, 0, 1);

  endShape();
}
