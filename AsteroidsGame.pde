boolean wKey = false;
boolean aKey = false;
boolean dKey = false;
boolean sKey = false;
boolean spaceBar = false;
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
public void draw() 
{
  if(((Spaceship)Player).getAlive()){
  if(aKey){
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
  if(dKey){
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
  a.checkForContact();
  }
  }
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
