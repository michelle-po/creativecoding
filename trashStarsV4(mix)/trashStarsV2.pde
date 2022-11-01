import peasy.PeasyCam;
PeasyCam[] cameras = new PeasyCam[1];

PImage sun;

PShape sphere;
PImage part;

float ry;

PlanetData[] planets= {   //nom, taille, vitesse
  new PlanetData("head", 10, 15),
  new PlanetData("pizza", 10, 5 ),
  new PlanetData("bird", 3, 1),
  new PlanetData("cat", 5, 35),
  new PlanetData("heart", 10, 0.04),
  new PlanetData("eye", 10, 2 ),
  new PlanetData("rocket", 1, 6),
  new PlanetData("rubik", 10, 61),
  new PlanetData("toilet", 10, 20)
};

Planet [] tabPlan = new Planet[planets.length];
Etoile [] etoiles = new Etoile[2500];


public void settings() {
  //scene
  fullScreen(P3D, SPAN);
}

///////////////////////////////////////////SETUP///////////////////////////////////////////

public void setup() {

  sun = loadImage("Flat_earth.png");

  //PLANETS
  for (int i=0; i<planets.length; i++) {
    tabPlan[i] = new Planet(planets[i].nom, 300+ i*200, planets[i].taille, planets[i].vitesse );
  }

  //STARS
  part = loadImage("particules.png");

  for (int i=0; i<etoiles.length; i++) {
    etoiles[i] = new Etoile(new PVector(random(-3000, 3000), random(-3000, 3000), random(-3000, 3000)), part);
  }

  cameras[0] = new PeasyCam(this, 2000);
}

///////////////////////////////////////////DRAW///////////////////////////////////////////

public void draw() {
  background(0);
  lights();
  ambientLight(100, 100, 150);

  //////////////OBJECTS

  //SUN
  pushMatrix();
  noStroke();
  rotateZ(PI);
  rotateY(-ry);
  sun.resize(200, 200);
  imageMode(CENTER);
  image(sun, 0, 0);
  ry += 0.005;
  popMatrix();

  //PLANETS
  for (int i=0; i<tabPlan.length; i++) {
    tabPlan[i].display();
  }

  //STARS
  for (int i=0; i<etoiles.length; i++) {
    etoiles[i].draw();
  }
}
