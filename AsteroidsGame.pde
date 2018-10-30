boolean wKey = false;
boolean aKey = false;
boolean dKey = false;
boolean sKey = false;
boolean spaceBar = false;
boolean cheats = false;
int kills = 0;
int firetimer = 0;
double leftturn = 1;
double rightturn = -1;
Floater Player;
ArrayList<Bullet> aBullets = new ArrayList<Bullet>();
ArrayList<Asteriod> aAsteriods = new ArrayList<Asteriod>();
ArrayList<Star> aStars = new ArrayList<Star>();
//your variable declarations here
public void setup() 
{
  size(1440,960);
  Player = new Spaceship();
  Player.show();
  for(int i = 0; i < 25; i++){
  aAsteriods.add(new Asteriod());
  }
  for(int x = 0; x < 100; x++){
  aStars.add(new Star());
  }
  //your code here
}
public void reset(){
wKey = false;
aKey = false;
dKey = false;
sKey = false;
spaceBar = false;
firetimer = 0;
leftturn = 1;
rightturn = -1;
kills = 0;
aBullets = new ArrayList<Bullet>();
aAsteriods = new ArrayList<Asteriod>();
aStars = new ArrayList<Star>();
  size(1440,960);
  Player = new Spaceship();
  Player.show();
  for(int i = 0; i < 25; i++){
  aAsteriods.add(new Asteriod());
  }
  for(int x = 0; x < 100; x++){
  aStars.add(new Star());
  }
}
public void draw() 
{
  if(((Spaceship)Player).getAlive()){
  if(dKey){
    if(leftturn < 10){
  leftturn += .25;
    }
  Player.turn((int)leftturn);
  } else{
  leftturn = 1;
  }
  if(spaceBar){
   if(firetimer == 0){
  ((Spaceship)Player).shoot();
  firetimer = 20;
   } else{
   firetimer--;
   }
  }
  if(wKey){
  Player.accelerate(.02);
  }
  if(sKey){
  Player.accelerate(-.02);
  }
  if(aKey){
    if(rightturn > -10){
   rightturn -= .25;
    }
  Player.turn((int)rightturn);
  } else{
  rightturn = -1;
  }
  Player.move();
  background(0);
  for(Star star : aStars){
  star.show();  
  }
  Player.show();
  ((Spaceship)Player).checkForContact();
  for(Bullet bullet : aBullets){
  bullet.move();
  bullet.show();
  }
  for(Asteriod a : aAsteriods){
  a.show();
  a.move();
  a.spawnt();
  if(a.checkForContact()){
  ((Spaceship)Player).upgrade();
  kills++;
  }
  }
  }
  stroke(255);
  fill(255);
  textSize(25);
  text("Asteroids Destroyed: " + kills, 25,940);
  //your code here
}
public void keyPressed(){
if(key == 'a' || key == 'A'){
aKey = true;
}
if(key == 's' || key == 'S'){
sKey = true;
}
if(key == 'd' || key == 'D'){
dKey = true;
}
if(key == 'w' || key == 'W'){
wKey = true;
}
if(key == ' '){
spaceBar = true;
}
if(key == 'r'){
reset();
}
if(key == '2'){
((Spaceship)Player).hyperspace();
}
}
public void keyReleased(){
if(key == 'a' || key == 'A'){
aKey = false;
}
if(key == 's' || key == 'S'){
sKey = false;
}
if(key == 'd' || key == 'D'){
dKey = false;
}
if(key == 'w' || key == 'W'){
wKey = false;
}
if(key == ' '){
spaceBar = false;
firetimer = 0;
}
}
public void mouseMoved(){
  if(cheats){
Player.setX((int)mouseX);
Player.setY((int)mouseY);
  }
}
