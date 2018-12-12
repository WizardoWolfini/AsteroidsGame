class Missile extends Bullet{
public Missile(double x, double y, double direction,boolean ally){
super(x,y,direction,ally);
corners = 5;
accelerate(5);
int [] yCornersI = {0,2,2,-2,-2};
int [] xCornersI = {5,3,0,0,3};
xCorners = xCornersI;
yCorners = yCornersI;
isMissile = true;
}
public void explode(){
  fill(255);
  ellipse((float)myCenterX,(float)myCenterY,100,100);
  for(Asteriod a : aAsteriods){
  if(dist(a.getX(),a.getY(),(float)myCenterX,(float)myCenterY) < 50){
  a.setDeath();
  }
  }
for(Alien ai : UFOArray){
if(dist(ai.getX(),ai.getY(),(float)myCenterX,(float)myCenterY) < 50){
ai.minusHP();
}
}
}
}
