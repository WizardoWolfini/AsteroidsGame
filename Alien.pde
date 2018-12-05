class Alien extends Spaceship
{
  private int hp;
  private int firetimer;
public Alien(){
 myPointDirection = 90;
  myCenterX = Math.random()*1440;
  myCenterY = Math.random()*960;
  corners = 6;
  xCorners = new int[corners];
  yCorners = new int[corners];
    int[] xS = {5,5,0,-3,-3,0};
  int[] yS = {-5,5,10,5,-5,-10};
  xCorners = xS;
  yCorners = yS;
  myColor = 200;
  alive = true;
  hp = 10;
  firetimer = 0;
  myDirectionX = 9*Math.random()-4;
  myDirectionY = 3 * Math.random()-1;
}

private double shootdir(Spaceship spaceship){
  double x = myCenterX - spaceship.getX();
  double angletemp = Math.acos(x/dist((float)myCenterX,(float)myCenterY,(float)spaceship.getX(),(float)spaceship.getY()));
  if(myCenterY - spaceship.getY() >= 0){
  return 360 - angletemp *180/Math.PI;
  }else{
  return angletemp * 180 / Math.PI;
  }
}

public void shoot(Spaceship spaceship){
  if(alive){
    if(firetimer >= 300){
  Bullet bullet1;
  bullet1 = new Bullet(myCenterX,myCenterY,180 - shootdir(spaceship),false);
  myPointDirection = 180 - shootdir(spaceship);
  aBullets.add(bullet1);
  firetimer = 0;
    } else{
    firetimer++;
    }
  }
 }
public void checkForContact(){
  if(alive){
  for(Bullet bullet : aBullets){
  if(bullet.getAlive()&&bullet.getFriendly()){
  if(dist((float)bullet.getX(),(float)bullet.getY(),(float)myCenterX,(float)myCenterY) <= 15){
  bullet.kill();
  hp--;
  if(hp <= 0){
  alive = false;
  corners = 0;
  }
  }
 }
}
  }
}
  
  
  
  
  
  
  
  
  
  

}
