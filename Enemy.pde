class Enemy{
	int x = 0;
	int y = 0;
	int type;
	int speed= 5;
        int life=1;   
        int damage;
	PImage enemyImg;
	Enemy(int x, int y, int type) {
		this.x = x;
		this.y = y;
		this.type = type;
           this.life=1;
           damage=20;
		enemyImg = loadImage("img/enemy.png");
		
	}
	void move() {
       this.x+= speed;	
	}

	void draw()
	{
		image(enemyImg, x, y);
	}

   boolean isCollideWithFighter()	
 {   if (isHit(this.x, this.y, this.enemyImg.width, this.enemyImg.height, fighter.x, fighter.y, fighter.fighterImg.width, fighter.fighterImg.height)){    
  return true;
  }
  return false;
}
  boolean isCollideWithBullet(int i){
     if (bullets[i]!=null && isHit(this.x, this.y, this.enemyImg.width, this.enemyImg.height, bullets[i].x, bullets[i].y, bullets[i].bulletImg.width, bullets[i].bulletImg.height)==true){    
  return true;
  }
  return false;
  }

	boolean isOutOfBorder()
  {if(this.x>width){
   return true;
 }else{return false;
   }
	}


}

void addEnemy(int type)
{	
	for (int i = 0; i < enemyCount; ++i) {
		enemys[i] = null;
	}
	switch (type) {
		case EnemysShowingType.STRAIGHT:
			addStraightEnemy();
			break;
		case EnemysShowingType.SLOPE:
			addSlopeEnemy();
			break;
		case EnemysShowingType.DIAMOND:
			addDiamondEnemy();
			break;
		case EnemysShowingType.STRONGLINE:
			addEnemyStrong();
			break;
	}
	time = millis();
}

void addStraightEnemy()
{
	float t = random(height - 60);
	int h = int(t);
	for (int i = 0; i < 5; ++i) {
		enemys[i] = new Enemy( (i+1)*-80, h , FlightType.ENEMY);
	}
}
void addSlopeEnemy()
{
	float t = random(height - 60 * 5);
	int h = int(t);
	for (int i = 0; i < 5; ++i) {
		enemys[i] = new Enemy((i+1)*-80, h + i * 50 , FlightType.ENEMY);
	}
}
void addDiamondEnemy()
{
	float t = random( 60 * 3 ,height - 60 * 3);
	int h = int(t);
	int x_axis = 1;
	for (int i = 0; i < 8; ++i) {
		if (i == 0 || i == 7) {
			enemys[i] = new Enemy((x_axis+1)*-80, h, FlightType.ENEMY);
			x_axis++;
		}
		else if (i == 1 || i == 5){
			enemys[i] = new Enemy((x_axis+1)*-80, h + 1 * 40, FlightType.ENEMY);
			enemys[i+1] = new Enemy((x_axis+1)*-80, h - 1 * 40, FlightType.ENEMY);
			i++;
			x_axis++;
			
		}
		else {
			enemys[i] = new Enemy((x_axis+1)*-80, h + 2 * 40, FlightType.ENEMY);
			enemys[i+1] = new Enemy((x_axis+1)*-80, h - 2 * 40, FlightType.ENEMY);
			i++;
			x_axis++;
		}
	}
}
void addEnemyStrong()
{       wait = 8000;
	for (int i = 0; i < 5; ++i) {
          enemys[i] = new Boss(0, 40+ i * 85);
	}
}
