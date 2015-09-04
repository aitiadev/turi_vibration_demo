
const int sens = A0;
int sensorReading = 0;


void setup(){

  Serial.begin(9600);
}


void loop(){
  
  sensorReading = analogRead(sens);
  Serial.println(sensorReading);
}

