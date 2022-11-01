class Pizza {

  PImage pizza;
  float ry=random(0, 0.04);

  Pizza() {

    //PIZZA
    pizza = loadImage("pizza.png");
    textureMode(NORMAL);
  }

  void display() {

      pushMatrix();
      rotateY(this.ry);
      scale(0.008);
      imageMode(CENTER);
      image(pizza, 0, 0);
      popMatrix();
 
}
}
