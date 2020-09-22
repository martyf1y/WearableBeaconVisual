class BirdObject
{
  PVector pos;
  float dirAngle=0;            // direction of birds
  float randomSpeedChange=random(1)-0.5;       // magnitude of random speed changes
  int unrest=5;                                // % chance of random changes
  float speed=0;
  float minSpeed=3;                            // lower speed limit
  float maxSpeed=10;                            // upper speed limit
  int timer;
  float endTime = 1000;
  PVector moveStep = new PVector(0, 1);;
  float dir = 0;
   float ranWave = random(7, 10);
   float ranWaveWidth = random(3, 10); // This is the width between each spiral side, larger is wider
  BirdObject(float inX, float inY, float inSPEED) {
    pos = new PVector(inX, inY); 
    speed = inSPEED;  
    timer = millis();
  }

  void Move() {
    //moveStep = new PVector(0,1);
  //  if (endTime <=  millis() - timer) {
  //    dir = cos(degrees(random(-15, 15)));
  //    timer = millis();
  //    endTime = random(500, 3000);
  //  } 
    float wave =sin(radians(millis()*(ranWave*0.1)));
    moveStep = new PVector(dir + wave * ranWaveWidth, 1);
   // moveStep.x = moveStep.x * speed;
    moveStep.y = moveStep.y * speed;
   //    moveStep.mult(speed);

    pos.add(moveStep);
    // check border condition

    if (pos.x<0) pos.x+=width;
    if (pos.x>=width) pos.x-=width;
    if (pos.y<0) {
      pos.y=0; 
      
  }
    if (pos.y>=height) {
    speed = random(3,7);
    pos.y-=height;
            pos.x = random(0, 310); 
       dir = cos(degrees(random(20, 120)));
       ranWave = random(7, 10);
    ranWaveWidth = random(3, 10);
    }
    speed += 0.09;
    // RandomChange the movement
   
  }
}

