//粒子数
int num = 1000;
//存放粒子的数组
Particle[] particles = new Particle[num];

void setup() {
  size(1024, 728, P3D);
  noStroke();
  //迭代生成所有粒子
  for (int i=0; i<num; i++) {
    PVector loc = new PVector(random(width*1.2), random(height));
    float angle = random(TWO_PI);
    PVector dir = new PVector(cos(angle), sin(angle));
    float speed = random(.5, 2);
    //构造函数加上度数，半径，圆心坐标
    particles[i]= new Particle(loc, dir, speed, 
      random(360), 80, width/2, height/2);
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
  PVector originLoc;
  //度数，半径，圆心坐标
  float degree, r, cx, cy;
  float acc;
  color col;
  Particle() {
  }
  //构造函数
  Particle(PVector _loc, PVector _dir, float _acc, 
    float _degree, float _r, float _cx, float _cy) {
    loc = _loc;
    dir = _dir;
    acc = _acc;
    degree = _degree;
    r = _r;
    cx = _cx;
    cy = _cy;
    //构造函数里没通过参数赋值的对象，有构造函数的，就在这里初始化一下
    originLoc = new PVector();
    updateVertexPos();
  }

  void updateVertexPos() {
    originLoc.x = cx+r*sin(radians(degree));
    originLoc.y = cy+r*cos(radians(degree));
  }



  //运动，渲染，越界函数打包在一个函数里
  void run() {
    if (mousePressed) {
      flow();
    } else if (key=='c') {
      circlize();
    }
    checkEdges();
    render();
  }

  void flow() {
    float angle=noise(loc.x/500, loc.y/500, millis()/10000)*TWO_PI;
    dir.x = cos(angle);
    dir.y = sin(angle);
 
    vel = dir.get();

    vel.mult(acc);

    loc.add(vel);
  }

  void circlize() {
    loc.lerp(originLoc, 0.01);
  }

  //超出窗口就随机一个窗口内位置
  void checkEdges() {
    if (loc.x<0 || loc.x>width || loc.y<0 || loc.y>height) {    
      loc.x = random(width*1.2);
      loc.y = random(height);
    }
  }

  //渲染
  void render() {
    ellipse(loc.x, loc.y, 2, 2);
  }
}