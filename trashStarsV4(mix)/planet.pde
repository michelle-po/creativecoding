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

  Pizza [] pizzas = new Pizza[1];
  Cube [] cubes = new Cube[1];

  Planet(String _noms, float _distance, int _taille, float _vitesse) {

    this.taille=_taille;
    this.sphere = loadShape(_noms+".obj");
    this.texture = loadImage(_noms+".jpg");
    this.distanceX = _distance;
    this.vitesse=_vitesse;
    this.noms=_noms;

    ////eye
    this.textureEye = loadImage("eye.jpg");
    this.sphereEye = createShape(SPHERE, this.taille);
    this.sphereEye.disableStyle();

    ////RUBIK
    //block = loadImage("block.png");
    //textureMode(NORMAL);

    ////PIZZA
    //pizza = loadImage("pizza.png");
    //textureMode(NORMAL);
  }

  void display() {

    pushMatrix();
    stroke(255, 50);
    noFill();
    rotateX(PI/2);
    circle(0, 0, this.distanceX*2);
    popMatrix();

    pushMatrix();
    //translate(width/2, 0);
    rotateY(this.vitesse);
    translate(this.distanceX, 0, 0);
    rotateY(this.ry);

    this.sphere.setTexture(this.texture);
    noStroke();
    scale(this.taille);
    rotateX(PI/2);
    shape(this.sphere);
    this.vitesse+=0.001;
    ry+=0.002;

    //rubik
    if (this.noms=="rubik") {
      cubes[0].display();
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
      pizzas[0].display();
    }
    popMatrix();
  }
}
