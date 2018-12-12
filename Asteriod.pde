class Asteriod extends Floater{
private boolean alive;
private int spawntimer;
private boolean death2;
public Asteriod(double speed){
initialize(speed);
}
private void initialize(double speed){
 myCenterX = 1440 * Math.random();
 myCenterY = 960 * Math.random();
 int[] xArray = {-15,-10,0,10,15,20,20,20,15,10,0,-10,-15,-20,-20,-20};
  int[] yArray = {15,20,20,20,15,10,0,-10,-15,-20,-20,-20,-15,-10,0,10};
  corners = 16;
for(int i = 0; i < corners; i++){
xArray[i] += Math.random() * 5 - 2;
yArray[i] += Math.random() * 5 - 2;
}
for(int j = 0; j < corners; j++){
xArray[j] *= .25 * Math.random() + .75;
yArray[j] *= .25 * Math.random() + .75;
xArray[j] = (int)xArray[j];
yArray[j] = (int)yArray[j];
}
xCorners = xArray;
yCorners = yArray;
myColor = 0;
myDirectionX = 0;
myDirectionY = 0;
myPointDirection = Math.random() * 360;
accelerate(.5 * speed);
alive = false;
spawntimer = 0;
}
public boolean getAlive(){
return alive;
}
public void move(){
turn((int)(2*Math.random())+2);
super.move();
}
public void spawnt(){
if(spawntimer <65){
 spawntimer++;
 myColor++;
  if(spawntimer == 60){
  alive = true;
  }
}
}
public boolean checkForContact(){
  if(death2){
  return true;
  }
  for(Bullet bullet : aBullets){
  if(bullet.getAlive()&&bullet.getFriendly()){
  if(doesIntersect(bullet)){
  bullet.kill();
  if(bullet.isM()){
  ((Missile)bullet).explode();
  }
  return true;
  }
  }
  }
  //for(Missile m : aMissiles){
  //if(m.getAlive()&&m.getFriendly()){
  //if(doesIntersect(m)){
  //m.kill();
  //m.explode();
  //return true;
  //}
 //}
//}
return false;
}
public void setDeath(){
death2 = true;
}
 public void setX(int x){
  myCenterX = x;
  }
  public int getX(){
  return (int)myCenterX;
  }
  public void setY(int y){
  myCenterY = y;
  }  
  public int getY(){
  return (int)myCenterY;
  }
  public void setDirectionX(double x){
  myDirectionX = x;
  }
  public double getDirectionX(){
  return myDirectionX;
  }
  public void setDirectionY(double y){
  myDirectionY = y;
  }   
  public double getDirectionY(){
  return myDirectionY;
  }   
  public void setPointDirection(int degrees){
  myPointDirection = degrees;
  }
  public double getPointDirection(){
  return myPointDirection;  
  }
}
