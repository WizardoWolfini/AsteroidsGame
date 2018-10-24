class Bullet{
private double myX1;
private double myX2;
private double myY1;
private double myY2;
private double xSpeed;
private double ySpeed;
private boolean alive;
private int timealive;
Bullet(double x, double y, double direction){
myX1 = x;
myY1 = y;
double radians = direction*(Math.PI/180);     
xSpeed = (5 * Math.cos(radians));    
ySpeed = (5 * Math.sin(radians));     
myX2 = x + xSpeed;
myY2 = y + ySpeed;
alive = true;
timealive = 0;
}
public void show(){
  if(alive){
  stroke(255);
line((float)myX1,(float)myY1,(float)myX2,(float)myY2);
timealive++;
if(timealive > 300){
alive = false;
}
  }
}
public void move(){
  if(alive){
myX1 += xSpeed;
myY1 += ySpeed;
myX2 += xSpeed;
myY2 += ySpeed;
  }
}
public boolean getAlive(){
return alive;
}
public void kill(){
alive = false;
}
public double getX(){
return myX2;
}
public double getY(){
return myY2;
}
}
