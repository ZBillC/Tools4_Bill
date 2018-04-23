//   一个 - 多个 - 动起来 - 正确的动起来 - 流场 - 跟着流场动 - UI
ParticleSystem ps;
PImage home;
color movColors[];
int cellSize = 2;
int cols,rows;
ArrayList <PVector> blackpos;
void setup(){
size(483,726,P3D);
rectMode(CENTER);
home = loadImage("home.png");
imageMode(CENTER);
movColors = new color[home.width*home.height]; //set the nunber of array
  cols = home.width / cellSize;                   //calculate the cols and rows
  rows = home.height / cellSize; 
home.loadPixels();
loadPixels();
blackpos=new ArrayList <PVector>();
 for (int i = 0; i < cols; i++) {               //in cols direction
      // Begin loop for rows
      for (int j = 0; j < rows; j++) {             //in rows direction
      
        // Where are we, pixel-wise?
        int x = i*cellSize;                        //calculate x coordinate of the current pixel
        int y = j*cellSize;                        //calculate y coordinate of the current pixel.
        int loc = (x + 1) + y*home.width;         //calculate the array number
        float r = red(home.pixels[loc]);          //get r g b value of the current pixel.
        float g = green(home.pixels[loc]);
        float b = blue(home.pixels[loc]);
        // Make a new color with an alpha component
        //movColors[loc]= color(r, g, b);            //set current pixels color/initialize color array
        //alpha( movColors[loc] )==255
        color col = home.get(i*2,j*2);
        if(alpha(col)>0){
          blackpos.add(new PVector(x,y));
        }
        //if(r==0){
        //blackpos.add(new PVector(x,y));
        //}
    }}
ps = new ParticleSystem();
ps.generate();
}

void draw(){

translate(width/2,height/2);
fill(0,10);
rect(0,0,width,height);
if(key == 'd'){
image(home,0,0);
}
ps.display();
ps.seek();
  if(key == 'f'){
ps.follow();
}else if(key == 'f'){


}
}