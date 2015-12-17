class Bullet{
   int x ;
   int y ;
   int speed = 5;
   PImage bulletImg;
   Bullet() {
           this.x = fighter.x;
           this.y = fighter.y;
           this.bulletImg=loadImage("img/shoot.png");
	}

   void move(){
     x-=speed;
   }
   void display(){
    image(bulletImg,x,y);
    }
    
    boolean isOutOfBorder(){
    if (this.x < -30) {
      return true;
    }else{
      return false;
    }    
  }}
