class Star //note that this class does NOT extend Floater
{
  private float myX,myY;
  Star(){
  myX = (float)(Math.random() * 1440);
  myY = (float)(Math.random() * 960);
  }
  public void show(){
  noStroke();
  fill(255);
    ellipse(myX,myY,2,2);
  }
  //your code here
}
