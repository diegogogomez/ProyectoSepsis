//String inicio = "["; 
//String fin = "]";
int analogValue = 0; // variable to hold the analog value, ECG click card information collector.
int frecuencia_de_muestreo = 200; //The frecuency is given in Hz
int periodo = 1/frecuencia_de_muestreo;
int ledPin = 13; // if there is a LED, it is connected to digital Pin 13
int inPin = 7; // Pushbutton connected to digital Pin 7
int val = 0; // Variable to store de read value
int show = 9876; // Variable to stop the read value
void setup() {
  // Open the serial port at 9600 bps:
  Serial.begin(9600);
  pinMode(ledPin,OUTPUT); // Sets the digital Pin 13 as OUTPUT
  pinMode(inPin,INPUT); // Sets the digital Pin 7 as INPUT
}

void loop() {
  // Read de analog input in Pin 0 
val = digitalRead(inPin); //Read the input Pin 
digitalWrite(ledPin,val); //Set the LED to the button´s value
if (val==1){
  Serial.println(show);
}
else {
  analogValue= analogRead(0);
  Serial.println(analogValue);
}
//delay(1000/periodo);
delay(20);//Delay de prueba
}
