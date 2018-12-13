class Spaceship extends Floater  
{ 
  private int numberofbullets;
  protected boolean alive;
  private int hp;
  private boolean shootbullet;
  public Spaceship(){
    hp = 3;
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
  numberofbullets = 0;
  shootbullet = true;
  }
  public void checkForContact(double speedAsteriod){
  for(Asteriod a : aAsteriods){
    if(a.getAlive()){
   if(doesIntersect(a)){
   hp--;
   a.initialize(speedAsteriod);
    }
    }
  }
  for(Bullet bullet : aBullets){
  if(bullet.getAlive() && !bullet.getFriendly()){
  if(doesIntersect(bullet)){
  hp--;
  bullet.kill();
  }
  }
  }
  if(hp <= 0){
  alive = false;
  }
  }
  public void hyperspace(){
  myDirectionX = 0;
  myDirectionY = 0;
  myCenterX = Math.random() * 1440;
  myCenterY = Math.random() * 960;
  myPointDirection = Math.random() *360;
  }
  public void shoot(){
  Bullet bullet1;
  Missile Missile1;
  if(shootbullet == false){
  Missile1 = new Missile(myCenterX,myCenterY,myPointDirection,true);
  aBullets.add(Missile1);
  }else{
  for(int i = -numberofbullets; i <= numberofbullets; i++){
  bullet1 = new Bullet(myCenterX,myCenterY,myPointDirection-10 * i,true);
  aBullets.add(bullet1);
  }
  }
  }
  public void changefiretype(){
  shootbullet = !shootbullet;
  }
  public void colorchange(int n){
  myColor -= n;
  }
  public void accelerate(double speed){
    myDirectionX = 0;
    myDirectionY = 0;
  super.accelerate(speed);
  }
  public void accelerate(int angle, double speed){
    myDirectionX = 0;
    myDirectionY = 0;
  myPointDirection += angle;
  super.accelerate(speed);
  myPointDirection -= angle;
  }
  public void upgrade(){
    if(numberofbullets <= 17){
  numberofbullets++;
  hp = 3;
    }
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
  public int getHp(){
  return hp;
  }
  public void addHp(int x){
    if(hp < 3){
  hp += x;
    }
  }
}
