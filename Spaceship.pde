class Spaceship extends Floater  
{ 
  private boolean alive;
  Spaceship(){
  myPointDirection = 0;
  myCenterX = 540;
  myCenterY = 360;
  corners = 6;
  xCorners = new int[corners];
  yCorners = new int[corners];
  int[] xS = {10,-10,-5,0,-5,-10};
  int[] yS = {0,10,2,0,-2,-10};
  xCorners = xS;
  yCorners = yS;
  myColor = 200;
  alive = true;
  }
  public void checkForContact(){
  for(Asteriod a : aAsteriods){
  /*double distancex = a.getX() - myCenterX;
  double distancey = a.getY() - myCenterY;
  double distancetotal = distancex * distancex + distancey * distancey;
  distancetotal = Math.sqrt(distancetotal);*/
  if(dist((float)a.getX(),(float)a.getY(),(float)myCenterX,(float)myCenterY) <= 10){
  alive = false;
  }
  }
  }
  public void hyperspace(){
  myDirectionX = 0;
  myDirectionY = 0;
  myCenterX = Math.random() * 1440;
  myCenterY = Math.random() * 960;
  }
  public void shoot(){
  Bullet bullet = new Bullet(myCenterX,myCenterY,myPointDirection);
  aBullets.add(bullet);
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
  public boolean getAlive(){
  return alive;
  }
}
