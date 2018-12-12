class Bullet extends Floater{
protected boolean alive;
protected boolean isMissile;
protected int timealive;
protected boolean ifFriendly;
public Bullet(double x, double y, double direction,boolean ally){
myCenterX = x;
myCenterY = y;
myColor = 255;
corners = 2;
myPointDirection = direction;
accelerate(5);
int [] xCornersI = {0,5};
int [] yCornersI = {0,0};
xCorners = xCornersI;
yCorners = yCornersI;
alive = true;
timealive = 0;
ifFriendly = ally;
isMissile = false;
}
public boolean isM(){
return isMissile;
}
public void show(){
  if(alive){
  timealive++;
  super.show();
if(timealive > 150){
alive = false;
}
  }
}
public boolean getFriendly(){
return ifFriendly;
}
public void move(){
  if(alive){
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;    
    if(myCenterX >width ||myCenterX<0 ||myCenterY >height ||myCenterY < 0)
    {       
      kill();  
    }    
    myCenterX -= myDirectionX;    
    myCenterY -= myDirectionY;  
  super.move();
  }
}
public void kill(){
alive = false;
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
