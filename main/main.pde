public int dead =0;
PImage img;
float bigx = random(0,1080);
float bigy = 100;
float speedx = random(-4,4);
float speedy = 6;
float backy;
float backx;
float frametimer =21;
public int score = 0;
int multi =0;
public String [] x;
public boolean mouseclick = false;
public int deadcount = 0;
int highscore;



void setup() {
 fullScreen();
  background(0);
  img = loadImage("10.jpg");
   text(score,700,60);
   x = loadStrings("a.txt");
  
}
void draw() {
  if (deadcount == 1) {
    deadcount = 0;
    reset();
  }
  frametimer += 1;
  bigx += speedx;
  bigy += speedy;
  if (bigy > height){ //<>//
    background(0); //<>//
    imageMode(CENTER); //<>//
    image(img, width/2, height/2); //<>//
    textSize(26);
    text(score, 830 + textWidth("final score:"),400); //<>//
    text("final score:",830,400); //<>//
    if ( score > max(int(x))) {
      x = append(x,str(score)); //<>//
    }
    highscore = max(int(x));
    text ("high score: ",830,350);
    text(highscore,830 + textWidth("high score: "),350);
    if (dead == 0){
      saveStrings("a.txt",x);
    } //<>//
    noLoop(); //<>//
    dead += 1; //<>//
    loop(); //<>//
    
  
 }
  if ( bigy > height || bigy <0) {
     speedy *= -1;
  }
  
  if ( bigx > width || bigx <0) {
     speedx *= -1;
  }
  if (backy <1000){
  backy =  995;    
  } else {
   backy = mouseY;
  }
  if ( backx > width){
   backx = width - 100;
  } else{
   backx=mouseX;
  }
  
  if ( bigx+speedx < mouseX +100  && bigx+speedx > mouseX && bigy+speedy < backy+25 && bigy+speedy+25 > backy){
      speedy *= -1;
      
      
      if ( speedy > 0 && frametimer > 20){
        speedy += 1;
        
         }
      else if (  frametimer > 20)  { 
        speedy -= 1;
        
        }
      if ( speedx > 0 && frametimer > 20){
        speedx += 1;
        
         }
      else if ( frametimer > 20 ) { 
        speedx -= 1;
       
         }
        
      if ( dead < 1 && frametimer > 20){
        multi ++;
        score += multi;
      
    }
    frametimer -= frametimer ;
  


}
      
      
      
   
  if (dead < 1 ){
  fill(0,255,0);
    background(0,0,150);
     textSize(26);
     text(score,1700,60);
    ellipse(bigx,bigy,50,50);

    rect(mouseX,backy,100,20);
  }
  
  
}
