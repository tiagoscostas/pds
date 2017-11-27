import processing.serial.*;
PImage fundo,ledOn, ledOff;
Serial myPort;   
String inString;  
float volt=0;
float x=41,y=0;
String retorno;
float contador;
double result;
float volts;


void setup(){ 
size (678,578);
fundo = loadImage("fundo.png");
ledOn=loadImage("ledVermelhoOn.png");
ledOff= loadImage("ledOff.png");
myPort = new Serial(this, Serial.list()[0], 9600); 
myPort.bufferUntil(10);
inString = "00000000";  
background(fundo);
}

void draw(){ 
  if(x<645){
result = 0;
contador = 0;
   for(int i=0;i<inString.length();i++){
        char c = inString.charAt(i);
        if(c=='1') { // trato apenas a entrada quando for 1
           result = Math.pow(2,i); // realizando a potencia de 2
           contador = contador + (float)result;
           image(ledOn,(i*60+210),510);  
      }else{
      image(ledOff,(i*60+210),510);
      }
    }
    volts = (5*contador)/255; // calculo para encontra a tensao
fill(185);
noStroke();
rect(100, 300, 85, 37);//fundo do dysplay do multimetro 
fill(0,0,5);//cor dos numeros do multimetro
textSize(30);// tamanho da letra do diplay do voltimetro
text(volts, 90, 330); //local e do display do voltimetro
y = map(volts, 5, 0, 80, 238);// dimensoes do grafico  
stroke(131, 146,125);//cor da linha do grafico     
strokeWeight(5);// tamanho da linha do grafico    
point(x,y);//exio de dertrminao do display de grafico
x++;
delay(120);//tempo de execução do gráfico
  }else{
  background(fundo);//reiniciar o grafico quando chegar ao fim do display
  x=41;
  }
}

void serialEvent(Serial p) {       
  inString = p.readString();       
  inString = inString.substring(0, 8); 
}    