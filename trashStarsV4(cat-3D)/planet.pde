class Planet {

  PShape sphere;
  PImage texture;

  float distanceX;
  float positionY;

  float ry=random(0, 0.04);
  float rmoon= 0.2;
  int taille;

  float vitesse;

  String noms;


  Planet(String _noms, float _distance, int _taille, float _vitesse) {

    this.taille=_taille;
    this.sphere = loadShape("cat.obj");
    this.texture = loadImage(_noms+".jpg");
    println(_noms);
    this.distanceX = _distance;
    this.vitesse=_vitesse;
    this.noms=_noms;
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
        rotateX(PI/2);

    noStroke();
    //Camera position
    x = modelX(0, 0, 0);
    y = modelY(0, 0, 0);
    z = modelZ(0, 0, 0);
    scale(this.taille);
    this.sphere.setTexture(this.texture);
    shape(this.sphere);
    this.vitesse+=0.001;
    ry+=0.002;

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
