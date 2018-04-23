class Particle{
PVector loc;
PVector vel;
PVector acc;
PVector homeloc;
PVector chomeloc;
PVector dir;
float speed,zoff;
Particle(PVector loc_,PVector homeloc_,PVector chomeloc_,float speed_){

loc = loc_.get();
speed=speed_;
homeloc = homeloc_;
chomeloc = chomeloc_;

vel = new PVector(0,0);
acc = new PVector(0,0);
}
void live(){
display();
checkEdges();
}
void display(){
  noStroke();
  fill(255, 155);
  ellipse(loc.x,loc.y,2,2);
  zoff+=0.001;
}

void seek(){
//寻找家乡
if(key =='p'){
float x_ = lerp(loc.x,homeloc.x-width/2,0.01);
float y_ = lerp(loc.y,homeloc.y-height/2,0.01);
loc.x = x_;
loc.y = y_;
}else if(key =='c'){
float x_ = lerp(loc.x,chomeloc.x-width/2,0.01);
float y_ = lerp(loc.y,chomeloc.y-height/2,0.01);
loc.x = x_+2.5;
loc.y = y_+3.5;
}


}
void follow(){
//跟随flow field
    float angle=noise(loc.x/500,loc.y/500, millis()/10000)*TWO_PI;
    acc.x = cos(angle);
    acc.y = sin(angle);
    vel.add(acc);
    vel.mult(random(0.2,1));
    loc.add(vel);

}
void checkEdges() {
  if (loc.x<-width/2 || loc.x>width/2 || loc.y<-height/2-100 || loc.y>height/2+100) {    
    loc.x = random(-width/2,width/2);
    loc.y = random(-height/2,height/2);
    }
  }
  
}