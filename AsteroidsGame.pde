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
ArrayList<Alien> UFOArray = new ArrayList<Alien>();
ArrayList<Bullet> aBullets = new ArrayList<Bullet>();
ArrayList<Asteriod> aAsteriods = new ArrayList<Asteriod>();
ArrayList<Star> aStars = new ArrayList<Star>();
//your variable declarations here


public void setup() 
{
  frameRate(60);
  size(1440,960);
  Player = new Spaceship();
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
  if(spaceBar){
   if(firetimer == 0){
  ((Spaceship)Player).shoot();
  firetimer = 15;
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
  speed += .15;
  }
  }else{
  Player.setDirectionX(Player.getDirectionX()/1.025);
  Player.setDirectionY(Player.getDirectionY()/1.025);
  }
  if(aKey){
    if(rightturn > -5){
   rightturn -= 1;
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
  ((Spaceship)Player).upgrade();
  kills++;
  upgradekills--;
  speedAsteriod += .1;
  listRemoveAsteriods.add(a);
  if(upgradekills == 0){
  upgradethreshhold *= 2;
  upgradekills = upgradethreshhold;
  UFOArray.add(new Alien()); 
  if(speed > 1){
  speed -= .1;
  }
}
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
  stroke(255);
  fill(255);
  textSize(25);
  text("Asteroids Destroyed: " + kills, 25,940);
  text("Asteroids until next upgrade: " + upgradekills, 500,940);
  text("HP: " + ((Spaceship)Player).getHp(),100,100);
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
