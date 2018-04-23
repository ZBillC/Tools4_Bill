class ParticleSystem{
ArrayList<Particle> particles;
PVector bornloc;
PVector homeloc;
PVector chomeloc;
int r = 100;
float angle =0;
ParticleSystem(){

  particles = new ArrayList<Particle>();
}

void generate(){
  float yifen  = 360/500+0.1;  //疑问:本来是想着360度/粒子总数得到一小份,每个粒子得到一份,但是不知道为什么必须加上0.1才能有效果
 for(int i =1;i<8000;i++){
        bornloc = new PVector(-width/2+random(width),-height/2+random(height));
        homeloc=blackpos.get(i);
        chomeloc = new PVector(random(width),random(height));
        chomeloc = new PVector(r*cos(angle),r*sin(angle));
        angle = angle + yifen;
     particles.add(new Particle(bornloc,homeloc,chomeloc,random(.5,2)));
 }
}
void display(){
for(int i = particles.size()-1;i>=0;i--){
  Particle p = particles.get(i);
  p.display();
  p.checkEdges();
}
}

void seek(){
for(int i = particles.size()-1;i>=0;i--){
  Particle p = particles.get(i);
  p.display();
  p.seek();
}
}

void follow(){
for(int i = particles.size()-1;i>=0;i--){
  Particle p = particles.get(i);
  p.display();
  p.follow();
}
}


}