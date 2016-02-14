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
  ANSEL  = 0x00;                          // Configure AN0 & AN1 pins as analog, the rest digital
  ANSELH = 0;
  C1ON_bit = 0;                       // Disable comparators
  C2ON_bit = 0;

  PORTA = 0;
  TRISA = 0;                        // configure PORTA pins as input
  PORTB = 255;                          // set PORTC to 0
  TRISB = 255;
  TRISC = 0x00;                          // designate PORTC pins as output

  PORTC = 0;                          // set PORTC to 0
  TRISD=0;
  PORTD=0;

  UART1_Init(19200);
  // Turn on Timer 1 with 4x prescale as counter
T1CON = 0b00100000;
// Turn on PORTC and Global interrupt
INTCON.GIE = 1;
INTCON.PEIE = 1;
INTCON.RBIE = 1;
INTCON.RBIF = 0;
// Configuration for Interrupt-On_Change for PORTB0
IOCB.IOCB0 = 1;
           }
           
void interrupt()
{
  T1CON.TMR1ON = 1; // ON Counter
while(Echo == 1);
T1CON.TMR1ON = 0;
TMR = (unsigned int)TMR1H << 8;
TMR = TMR + TMR1L; // Combine 2x counter byte into single integer
    duration = (TMR/10) * 8;
     distance_cm = duration / 58 ;
     PORTD=distance_cm;
     if(distance_cm < 50 ) // If Ultrasonic sense less than 50cm
                    {
                   //   PORTD=1;
                      delay_ms(200);
                      mensaje=10;
                         UART1_Write(mensaje);
                     // PORTD.F0=0;
            }
            else
            {
                    // PORTD=1;
                    // PORTD.F0=1;
                    mensaje=100;
                         UART1_Write(mensaje);

            }
INTCON.RBIF = 0;

}

void main() {
  InitMain();

  current_duty  = 128;                 // initial value for current_duty


  while (1) {                         // endless loop
  TMR1H = 0; // Clear Timer1
   TMR1L = 0;
    if (Echo==0) {                    // button on RA0 pressed
      delay_us(40);
      Trig= 0;
      delay_us(2);
      Trig = 1;
      delay_us(10); // Send LOW-to-HIGH Pulse of 10us to Ultrasonic
      Trig= 0;
     }
    }
}