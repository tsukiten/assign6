class Boss extends Enemy{
 Boss(int x, int y){
   super(x, y, EnemysShowingType.STRONGLINE);
  super.enemyImg = loadImage("img/enemy2.png");
  super.speed=2;
  super.life=5; 
  super.damage=50;
 }
}
