String d;
void setup() { 
  pinMode(9, INPUT); // portas de entra
  pinMode(8, INPUT);
  pinMode(7, INPUT);
  pinMode(6, INPUT);
  pinMode(5, INPUT);
  pinMode(4, INPUT);
  pinMode(3, INPUT);
  pinMode(2, INPUT);
  Serial.begin(9600); // velocidade da porta serial
}

void loop() {
d = ""; // zera a string a cada loog
 for(int i=2; i<=9; i++){
  d =  String(d + digitalRead(i)); // contatenação da string
 }
Serial.println(d); // envia a string com os valores do ad pela serial 
delay(1000); // espera 100 milisegundos por conta do delay
}
