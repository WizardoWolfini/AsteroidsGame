class Asteriod extends Floater{
boolean alive;
int spawntimer;
public Asteriod(){
initialize();
}
private void initialize(){
 myCenterX = 1440 * Math.random();
 myCenterY = 960 * Math.random();
 int[] xArray = {-10,0,10,10,10,0,-10,-10};
  int[] yArray = {10,10,10,0,-10,-10,-10,0};
  corners = 8;
for(int i = 0; i < 7; i++){
xArray[i] += Math.random() * 10 - 5;
yArray[i] += Math.random() * 10 - 5;
}
xCorners = xArray;
yCorners = yArray;
myColor = 0;
myPointDirection = Math.random() * 360;
accelerate(.5);
alive = false;
spawntimer = 0;
}
public boolean getAlive(){
return alive;
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
  for(Bullet bullet : aBullets){
  if(bullet.getAlive()){
    /*double xdistance = bullet.getX() - myCenterX;
  double ydistance = bullet.getY() - myCenterY;
  double distancetotal= xdistance * xdistance + ydistance * ydistance;
  distancetotal = Math.sqrt(distancetotal);*/
  if(dist((float)bullet.getX(),(float)bullet.getY(),(float)myCenterX,(float)myCenterY) <= 15){
  bullet.kill();
  initialize();
  return true;
  }
  
}
}
return false;
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
