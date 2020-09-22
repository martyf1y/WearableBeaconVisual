// Script by Matt, June 2015

// First tasks
// Set an array of 31 strips with length of Stip
// Set 31 objects as strips
// Set each strip to have a declared amount of LEDS
// Each strip object has an LED object
// Each LED has an ID 

//// OR
// Set a 2D array
// Find where the Lights want to go
// Create an object with the info of the light,
// Delete object after it has been used


BirdObject Birdy; // This is for the sending the signal away
//int birdNum = 1;
//ArrayList Birds;

int maxLEDs = 1056;
boolean[] activeNum = new boolean [maxLEDs];
int [] speed = new int [maxLEDs];
//int[][] Rgb = new int [1056][3];
int [] brightness = new int [maxLEDs];
int [] stripNumArr = new int [maxLEDs];
int [] rowNumArr = new int [maxLEDs];
int[] LEDsArray = {24,25,26,27,38,40,40,40,40,37,36,35,35,34,34,34,34,34,35,35,36,37,40,40,40,40,38,27,26,25,24};

int stripNum; // This is which strip the LED is on
int rowNum; //This is how far up the LED is
int LEDNum; // This is the LED ID


void setup()
{
  size(320, 410);
  background(0);
    
//  for (int i=0; i<maxLEDs; i++) {
  //  SignalShine = new Signal(i);
  //  LED.add(SignalShine);
 // }
 //   Birds = new ArrayList();
//  for (int i=0; i<birdNum; i++) {
    Birdy = new BirdObject(random(0, 310), 0, random(5,8)+0.2);
 //   Birds.add(Birdy);
//  }
  
 // println(LEDsArray[3]);
 // stripNum = randomStart;
 // rowNum = 0;
 // LEDNum = 0;
 // for(int i = 0; i < randomStart; i++){
 // LEDNum += LEDsArray[i];
 // }
  //SignalShine = ( Signal ) LED.get(LEDNum);
  // You wont need to insert the exact position for arduino, just have the right ID
 // SignalShine.Activate(stripNum, rowNum, 0, 0, 255, 255, 10);
}

void draw()
{
  background(0);
//// The basic grid
  for (int x=0; x < LEDsArray.length; x++) {
    for(int y = 0; y < LEDsArray[x]; y++){
    fill(255, 255, 255);
    ellipse(x * 10 + 10, height - 10 - (y*10), 5, 5);
    }
  }
  

//  for (int i=0; i<birdNum; i++) {
    //Birdy = ( BirdObject ) Birds.get(i);
     Birdy.Move();
     stripNum = (int)(map(Birdy.pos.x, 0, width, 0, 31));
     rowNum = (int)(map(Birdy.pos.y, 0, height, 0, 40));
     LEDNum = 0;
 for(int n = 0; n < stripNum; n++){
    LEDNum += LEDsArray[n];
  }
   LEDNum += rowNum;
   if(rowNum < LEDsArray[stripNum]){
    activeNum[LEDNum] = true;
    speed[LEDNum] = 10;
    brightness[LEDNum] = 255;
    stripNumArr[LEDNum] = stripNum;
    rowNumArr[LEDNum] = rowNum;
    LEDNum = 0;
    // You wont need to insert the exact position for arduino, just have the right ID
   }
  //}

  
//////////// This updates the LEDs ////////////
 for (int i=0; i<maxLEDs; i++) {
    //SignalShine = ( Signal ) LED.get(i);
  if(brightness[i] != 0){
    println("Again the Number is " + i);
    ShineOn(i, rowNumArr[i], stripNumArr[i], brightness[i], speed[i]); //Get the right ID, brightness and speed to update LED
  }
  }
  
 // ALWAYS PUT SHOW AT THE BOTTOM !!!!!!!!!!!!!!!!!!!!!!
}

  void ShineOn(int ID, int rowNum, int columnNum, int bright, int thisSpeed){
    
    ///// Make sure to get LED brightness before we go any further!
  int r = 0;
  int b = 255;
  int g = 0;
    
  // This would just be the ID number
  fill(r,g,b, 255);
  ellipse(columnNum * 10 + 10, height - 10 - (rowNum*10),5,5);

  bright -= 1*thisSpeed;
  
  if(bright <= 0){
    bright = 0;
    activeNum[ID] = false;
    speed[ID] = 0;
  }
  brightness[ID] = bright;
  }
  
void keyPressed() { 
  if (key==' ') setup();
//  if (key=='f') fade=!fade;
}

