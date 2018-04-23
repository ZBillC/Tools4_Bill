
int num = 1000;
//存放粒子的数组
Particle[] particles = new Particle[num];

void setup() {
  size(1280,720);
  noStroke();
//迭代生成所有粒子
  for (int i=0; i<num; i++) {
    PVector loc = new PVector(random(width*1.2), random(height));
    float angle = random(TWO_PI);
    PVector dir = new PVector(cos(angle), sin(angle));
    float speed = random(.5, 2);
    particles[i]= new Particle(loc, dir, speed);
  }
}

void draw() {
//半透明背景
  fill(0, 10);
  noStroke();
  rect(0, 0, width, height);
  fill(255, 155);  
//遍历数组，每一个粒子都run起来
  for (int i=0; i<particles.length; i++) {
    particles[i].run();
  }
}

//粒子数据类型
class Particle {
//属性
  PVector loc, dir, vel;
  float speed;
  color col;
//构造函数
  Particle(PVector _loc, PVector _dir, float _speed) {
    loc = _loc;
    dir = _dir;
    speed = _speed;
  }
//运动，渲染，越界函数打包在一个函数里
  void run() {
    move();
    checkEdges();
    render();
  }
//运动函数
  void move() {
    float angle=noise(loc.x/500, loc.y/500, millis()/10000)*TWO_PI;
    dir.x = cos(angle);
    dir.y = sin(angle);
    vel = dir.get();
    vel.mult(speed);
    loc.add(vel);
  }
//超出窗口就随机一个窗口内位置
  void checkEdges() {
    if (loc.x<0 || loc.x>width || loc.y<0 || loc.y>height) {    
      loc.x = random(width*1.2);
      loc.y = random(height);
    }
  }

  void render() {
    ellipse(loc.x, loc.y, 2, 2);
  }
}