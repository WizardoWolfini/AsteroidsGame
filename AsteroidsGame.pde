//comment
boolean wKey = false;
boolean aKey = false;
boolean dKey = false;
boolean sKey = false;
boolean qKey = false;
boolean eKey = false;
boolean spaceBar = false;
boolean cheats = false;
int kills = 0;
int upgradekills = 50;
int upgradethreshhold = 50;
int firetimer = 0;
int spawntimer = 0;
int maxspawntimer = 40;
double speedAsteriod = 1;
double leftturn = 1;
double rightturn = -1;
double speed = 2;
Floater Player;
Capturepoint CP;
ArrayList<Alien> UFOArray = new ArrayList<Alien>();
ArrayList<Bullet> aBullets = new ArrayList<Bullet>();
ArrayList<Asteriod> aAsteriods = new ArrayList<Asteriod>();
ArrayList<Star> aStars = new ArrayList<Star>();
ArrayList<Spaceship> aSpaceships = new ArrayList<Spaceship>();
int taillength = 0;
int tailoffset = 0;
int cpointst = 10;
int points = 0;
int firerate = 15;
//your variable declarations here


public void setup() 
{
  frameRate(60);
  size(1440,960);
  Player = new Spaceship();
  CP = new Capturepoint();
  Player.show();
  for(int i = 0; i < 25; i++){
  aAsteriods.add(new Asteriod(speedAsteriod));
  }
  for(int x = 0; x < 100; x++){
  aStars.add(new Star());
  }
  for(int a = 0; a < 10; a++){
  //UFO.add(new Alien());
  }
  aSpaceships.add(new Spaceship());
  //your code here
}
public void reset(){
  firerate = 15;
  points = 0;
  cpointst = 10;
   CP = new Capturepoint();
  speed = 0;
  tailoffset = 0;
  taillength = 0;
  aSpaceships = new ArrayList<Spaceship>();
  aSpaceships.add(new Spaceship());
wKey = false;
aKey = false;
dKey = false;
sKey = false;
spaceBar = false;
firetimer = 0;
leftturn = 1;
rightturn = -1;
kills = 0;
upgradekills = 50;
upgradethreshhold = 50;
spawntimer = 0;
speedAsteriod = 1;
aBullets = new ArrayList<Bullet>();
aAsteriods = new ArrayList<Asteriod>();
aStars = new ArrayList<Star>();
  size(1440,960);
  Player = new Spaceship();
  UFOArray = new ArrayList<Alien>();
  Player.show();
  for(int i = 0; i < 25; i++){
  aAsteriods.add(new Asteriod(speedAsteriod));
  }
  for(int x = 0; x < 100; x++){
  aStars.add(new Star());
  }
}
public void draw() 
{
  if(tailoffset == 5){
  if(taillength < 5){
  aSpaceships.add(new Spaceship());
  aSpaceships.get(aSpaceships.size() -1).setX(Player.getX());
  aSpaceships.get(aSpaceships.size() -1).setY(Player.getY());
  aSpaceships.get(aSpaceships.size() -1).setPointDirection((int)Player.getPointDirection());
  aSpaceships.get(aSpaceships.size()-1).colorchange(50);
  taillength++;
  }else{
    aSpaceships.remove(aSpaceships.get(0));
    aSpaceships.add(new Spaceship());
  aSpaceships.get(aSpaceships.size() -1).setX(Player.getX());
  aSpaceships.get(aSpaceships.size() -1).setY(Player.getY());
  aSpaceships.get(aSpaceships.size() -1).setPointDirection((int)Player.getPointDirection());
  aSpaceships.get(aSpaceships.size()-1).colorchange(50);
  }
  tailoffset =0;
  } else{
  tailoffset++;
  }
  spawntimer++;
  if(spawntimer == maxspawntimer){
  spawntimer = 0;
  aAsteriods.add(new Asteriod(speedAsteriod));
  }
  if(((Spaceship)Player).getAlive()){
  if(dKey){
    if(leftturn < 5){
  leftturn += 1;
    }
  Player.turn((int)leftturn);
  } else{
  leftturn = 1;
  }
  if(aKey){
    if(rightturn > -5){
   rightturn -= 1;
    }
  Player.turn((int)rightturn);
  } else{
  rightturn = -1;
  }
  if(spaceBar){
   if(firetimer == 0){
  ((Spaceship)Player).shoot();
  firetimer = firerate;
   } else{
   firetimer--;
   }
  }
  if(wKey){
  Player.accelerate(speed);
  }
  if(sKey){
  Player.accelerate(-speed);
  }
  if(eKey){
  ((Spaceship)Player).accelerate(90,speed);
  }
  
  if(qKey){
  ((Spaceship)Player).accelerate(-90,speed);
  }
  if(wKey  || eKey || qKey){
  if(speed < 3.5){
  speed += .25;
  } else if(speed < 25){
  speed += .105;
  if(speed > 24.5){
  ((Spaceship)Player).hyperspace();
  speed = 0;
  }
  }
  }else{
  Player.setDirectionX(Player.getDirectionX()/1.025);
  Player.setDirectionY(Player.getDirectionY()/1.025);
  }
    if(speed > 1){
  speed -= .1;
  }
  Player.move();
  background(0);
  for(Star star : aStars){
  star.show();  
  }
    CP.show();
  if(CP.capture((Spaceship)Player)){
  if(cpointst > 0){
  cpointst--;
  }else{  
    points++;
  upgradekills -= 1;
  cpointst = 10;  
}
  }
  if(CP.getHealth()){
  ((Spaceship)Player).addHp(1);
  CP.minusHealth();
  }
  for(Spaceship aship : aSpaceships){
    aship.colorchange(3);
    if(speed > 5){
    aship.show();
    }
  }
  Player.show();
  ((Spaceship)Player).checkForContact(speedAsteriod);
  for(Bullet bullet : aBullets){
  bullet.move();
  bullet.show();
  }
  ArrayList<Asteriod> listRemoveAsteriods = new ArrayList<Asteriod>();
  for(Asteriod a : aAsteriods){
  a.show();
  a.move();
  a.spawnt();
  if(a.checkForContact()){
  kills++;
  points++;
  upgradekills--;
  if(speedAsteriod < 2.5){
  speedAsteriod += .03;
  }
  listRemoveAsteriods.add(a);
  }
  }
  for(Asteriod aAsteriod : listRemoveAsteriods){
  killAsteriod(aAsteriod);
  }
  for(Alien UFO : UFOArray){
  UFO.show();
  UFO.checkForContact();
  UFO.shoot((Spaceship)Player);
  UFO.move();
  }
  }
  if(upgradekills <= 0){
    ((Spaceship)Player).upgrade();
  upgradethreshhold *= 2;
  upgradekills = upgradethreshhold;
  UFOArray.add(new Alien()); 
}
  stroke(255);
  fill(255);
  textSize(25);
  text("Asteroids Destroyed: " + kills, 25,940);
  text("Points until next upgrade: " + upgradekills, 500,940);
  text("HP: " + ((Spaceship)Player).getHp(),100,100);
  text("Points: " + points, 1100,940);
  //your code here
}
public void killAsteriod(Asteriod a){
aAsteriods.remove(aAsteriods.indexOf(a));
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
if(key == 'q' || key == 'Q'){
qKey = true;
}
if(key == 'e' || key == 'E'){
eKey = true;
}
if(key == 'b' || key == 'B'){
speed = 10;
}
if(key == ' '){
spaceBar = true;
}
if(key == 'r'){
reset();
}
if(key == '2'){
((Spaceship)Player).hyperspace();
speed = 0;
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
if(key == 'q' || key == 'Q'){
qKey = false;
}
if(key == 'e' || key == 'E'){
eKey = false;
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
