class Capturepoint{
private int myX, myY;
private int capturetimer;
private int capturetimermax;
  public Capturepoint(){
myX = (int)(Math.random() * 1040)+200;
myY = (int)(Math.random() * 560)+200;
capturetimermax = 250;
capturetimer = 0;
  }
public void show(){
  stroke(0,255,0);
  noFill();
ellipse(myX,myY,100,100);
}
public boolean capture(Spaceship player){
  noStroke();
fill(0,255,0,25);
ellipse(myX,myY,100 * capturetimer/capturetimermax,100 * capturetimer/capturetimermax);
  if(dist(player.getX(), player.getY(), myX, myY) < 50){
    if(capturetimer <= capturetimermax){
capturetimer++;
    }else{
    reset();
    }
  }
return (dist(player.getX(), player.getY(), myX, myY) < 50);
}
private void reset(){
myX = (int)(Math.random() * 1040)+200;
myY = (int)(Math.random() * 560)+200;
capturetimermax = 250;
capturetimer = 0;
}
}
