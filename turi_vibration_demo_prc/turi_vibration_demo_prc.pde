
import processing.serial.*;
Serial port;

int cnt;
color col;
int x;



void setup(){

  size(800,400);
  printArray(Serial.list());
  String portName = Serial.list()[2];
  port=new Serial(this, portName,9600);
  port.bufferUntil(10);
  
  initGraph();
}



void draw(){
  
  fill(col);
  ellipse(cnt, x/5+100, 3, 3);
  
  if (cnt > width) {
    initGraph();
  }
  cnt++;
}



//グラフの初期化
void initGraph() {
  background(255);
  noStroke();
  cnt = 0;
  col = color(0, 200, 200);
}



void serialEvent(Serial p){

  String stringData = p.readStringUntil('\n');

  //文字列データが空ではないとき
  if(stringData != null){
    x = int(trim(stringData));
    println(x);
  }
}


void dispose(){
  port.clear();
  port.stop();
  println("Safety stopped!");
}

