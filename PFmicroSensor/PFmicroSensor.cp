#line 1 "C:/Users/Usuario/Desktop/ProyectoFinal_Guante/PFmicroSensor/PFmicroSensor.c"
unsigned short current_duty, old_duty, current_duty1, old_duty1;
unsigned int temp_res;
 unsigned int TMR;
 float duration ;
 float distance_cm ;
 unsigned int i;
 unsigned char mensaje;
 sbit Echo at PORTB.B0;
 sbit Trig at PORTA.B0;

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

 UART1_Init(19200);

T1CON = 0b00100000;

INTCON.GIE = 1;
INTCON.PEIE = 1;
INTCON.RBIE = 1;
INTCON.RBIF = 0;

IOCB.IOCB0 = 1;
 }

void interrupt()
{
 T1CON.TMR1ON = 1;
while(Echo == 1);
T1CON.TMR1ON = 0;
TMR = (unsigned int)TMR1H << 8;
TMR = TMR + TMR1L;
 duration = (TMR/10) * 8;
 distance_cm = duration / 58 ;
 PORTD=distance_cm;
 if(distance_cm < 50 )
 {

 delay_ms(200);
 mensaje=10;
 UART1_Write(mensaje);

 }
 else
 {


 mensaje=100;
 UART1_Write(mensaje);

 }
INTCON.RBIF = 0;

}

void main() {
 InitMain();

 current_duty = 128;


 while (1) {
 TMR1H = 0;
 TMR1L = 0;
 if (Echo==0) {
 delay_us(40);
 Trig= 0;
 delay_us(2);
 Trig = 1;
 delay_us(10);
 Trig= 0;
 }
 }
}
