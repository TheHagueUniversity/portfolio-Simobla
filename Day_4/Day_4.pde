// Declaration of variables. Declaration and creation of array.

float [] enemy = new float [10];
int i;
float x= 0;
float y = height*2;
int score = 0; 

// Function runs only once at the beginning of the program. Helps defining starting values.
void setup (){
 size(500,500);
 noStroke();
 ellipseMode(CORNER);
  
   // For loop that would fill the array with random values from 0 to height.
   for (int i = 0; i < enemy.length; i++) {
   enemy [i] = random(height);
   }
}

//Function runs  up until we quit the program.
void draw () {
  background (116, 159,188);
  drawEnemies();
  drawHero();
  drawScore();
  drawWin();
  
}

// First modular function that I created in order to draw the enemies.
void drawEnemies() {
  fill(255);
  
  /* For loop that allows me fill the array with values-> draw 10 rectangles at different heights in the canvas (as opposed to having all of them starting from the same 
  y-axis) thanks to the initial for loop in the setup() function.
  */
  
  for (int i = 0; i < enemy.length; i++) {
    int enemyX=i*50+25;
    int enemyY=int(enemy[i]);
    rect(enemyX, enemyY, 18, 18);
    
    // Declaring the fliat d variable in order to be able to use dist, to measure the distance between my enemies and my hero. 
    float d = dist(enemyX, enemyY, x, y);
      
      //Conditional that would allow me to restar the game if the distance < 20 pixels.
      if(d<20){
      println("hit");
      ellipse(x,y, 12, 12);
      x=0;
      score=0;
      }
  
    enemy [i] += int(random(8));
    
    // Conditional that allows me to have the enemies be drawn once they reach the height of the canvas.
    if (enemy[i] > height){
    enemy[i] = 0;  
    }
    
  }
}

//Second function created, in order to draw my hero.
void drawHero() {
  
  fill(0);
  ellipse (x,y, 12, 12);
  
  // Conditional that allows users to move the hero with specific keys.
  if(keyPressed){
    if(key == 'a' || key == 'A'){
    x-=1;
    score--;
  
    } else if(key == 'd'|| key == 'D'){
    x+=1;
    score++;
    }
  }
}
 
// Third function that draws a rectangle following the hero' x position. 
void drawScore() {
  rect(0, 10, score, 10);
}

// Fourth function that states when the game is won: when reaching the width of the canvas.
void drawWin() {
  if ( x> width){
  println("You win!");
  text("You Win!", width/2, height/2);
  textSize(50);
  }
}
