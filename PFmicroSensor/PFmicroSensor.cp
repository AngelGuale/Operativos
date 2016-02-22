#line 1 "C:/Users/Usuario/Desktop/ProyectoFinal_Guante/PFmicroSensor/PFmicroSensor.c"
unsigned short current_duty, old_duty, current_duty1, old_duty1;
unsigned int temp_res;
 unsigned int TMR;
 float duration ;
 float distance_cm ;
 unsigned int i;
 unsigned char mensaje;
 sbit Echo at PORTB.B1;
 sbit Trig at PORTA.B1;

 sbit Echo2 at PORTB.B0;
 sbit Trig2 at PORTA.B0;
 unsigned char alerta_sensor1=0;
 unsigned char alerta_sensor2=0;

 void enviaMensaje(unsigned char s1, unsigned char s2){
 if(s1==1 && s2==0){
 mensaje=10;
 UART1_Write(mensaje);
 }
 if(s2==1){
 mensaje=20;
 UART1_Write(mensaje);
 }
 if(s1==0 && s2==0){
 mensaje=100;
 UART1_Write(mensaje);

 }


 }

void InitMain() {
 ANSEL = 0x00;
 ANSELH = 0;
 C1ON_bit = 0;
 C2ON_bit = 0;

 PORTA = 0;
 TRISA = 0;
 PORTB = 255;
 TRISB = 255;
 TRISC = 0x00;

 PORTC = 0;
 TRISD=0;
 PORTD=0;
 TRISE=0;
 PORTE=0;

 UART1_Init(19200);

T1CON = 0b00100000;

INTCON.GIE = 1;
INTCON.PEIE = 1;
INTCON.RBIE = 1;
INTCON.RBIF = 0;

IOCB.IOCB1 = 1;

INTCON.INTE = 1;
INTCON.INTF = 0;
 }

void interrupt()
{
 T1CON.TMR1ON = 1;
 INTCON.GIE = 0;

 if(INTCON.INTF==0){
 while(Echo == 1 );
 T1CON.TMR1ON = 0;
 TMR = (unsigned int)TMR1H << 8;
 TMR = TMR + TMR1L;
 duration = (TMR*2);
 distance_cm = duration / 58 ;
 PORTD=distance_cm;
 if(distance_cm < 15 )
 {


 alerta_sensor1=1;
 enviaMensaje(alerta_sensor1, alerta_sensor2);

 }
 else
 {
 alerta_sensor1=0;
 enviaMensaje(alerta_sensor1, alerta_sensor2);

 }
INTCON.RBIF = 0;

INTCON.GIE = 1;
 TMR1H = 0;
 TMR1L = 0;


return;
}else if(INTCON.INTF==1){
 while(Echo2 == 1 );
 T1CON.TMR1ON = 0;
 TMR = (unsigned int)TMR1H << 8;
 TMR = TMR + TMR1L;
 duration = (TMR*2);
 distance_cm = duration / 58 ;
 PORTD=distance_cm;
 if(distance_cm > 7 )
 {
 alerta_sensor2=1;
 enviaMensaje(alerta_sensor1, alerta_sensor2);

 }
 else
 {
 alerta_sensor2=0;
 enviaMensaje(alerta_sensor1, alerta_sensor2);


 }
 INTCON.INTF = 0;

INTCON.GIE = 1;
 TMR1H = 0;
 TMR1L = 0;

}


}

void main() {
 InitMain();

 current_duty = 128;


 while (1) {
 TMR1H = 0;
 TMR1L = 0;
 PORTE.B0=alerta_sensor1;
 PORTE.B1=alerta_sensor2;

 if (Echo==0) {
 delay_us(40);
 Trig= 0;
 delay_us(2);
 Trig = 1;
 delay_us(10);
 Trig= 0;
 }

 if (Echo2==0) {
 delay_us(40);
 Trig2= 0;
 delay_us(2);
 Trig2 = 1;
 delay_us(10);
 Trig2= 0;
 }

 }
}
