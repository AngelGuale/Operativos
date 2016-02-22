


unsigned short current_duty, old_duty, current_duty1, old_duty1;
unsigned int temp_res;
 unsigned int TMR;
  float duration ;
    float distance_cm ;
    unsigned char i;

void Tone1() {
  Sound_Play(659, 250);   // Frequency = 659Hz, duration = 250ms
}
 void Do_T() {
  Sound_Play(262, 250);   // Frequency = 659Hz, duration = 250ms
}
 void Re_T() {
  Sound_Play(294, 250);   // Frequency = 659Hz, duration = 250ms
} void Mi_T() {
  Sound_Play(330, 250);   // Frequency = 659Hz, duration = 250ms
}

 void Fa_T() {
  Sound_Play(349, 250);   // Frequency = 659Hz, duration = 250ms
} void Sol_T() {
  Sound_Play(392, 250);   // Frequency = 659Hz, duration = 250ms
} void La_T() {
  Sound_Play(440, 100);   // Frequency = 659Hz, duration = 250ms
}
 void Si_T() {
  Sound_Play(494, 100);   // Frequency = 659Hz, duration = 250ms
}

void Tone2() {
  Sound_Play(698, 250);   // Frequency = 698Hz, duration = 250ms
}

void Tone3() {
  Sound_Play(784, 250);   // Frequency = 784Hz, duration = 250ms
}

void Melody() {           // Plays the melody "Yellow house"
 Si_T(); La_T();
  }

void InitMain() {
  ANSEL  = 0x00;                          // Configure AN0 & AN1 pins as analog, the rest digital
  ANSELH = 0;
  C1ON_bit = 0;                       // Disable comparators
  C2ON_bit = 0;

  PORTA = 255;
  TRISA = 255;                        // configure PORTA pins as input
  PORTB = 0;                          // set PORTC to 0
  TRISB = 0;
  TRISC = 0xF0;                          // designate PORTC pins as output

  PORTC = 0;                          // set PORTC to 0
  TRISD=0;
  PORTD=0;

Sound_Init(&PORTE, 0);
Sound_Play(880, 500);             // Play sound at 880Hz for 1 second

  PWM1_Init(900);                    // Initialize PWM1 module at 1KHz
  
  UART1_Init(19200);
     /*
  // Turn on Timer 1 with 4x prescale as counter
T1CON = 0b00100000;
// Turn on PORTB and Global interrupt
INTCON.GIE = 1;
INTCON.PEIE = 1;
INTCON.RBIE = 1;
INTCON.RBIF = 0;
// Configuration for Interrupt-On_Change for PORTB0
IOCB.IOCB0 = 1;
*/
}

void main() {
  InitMain();

  current_duty  = 128;                 // initial value for current_duty

  PWM1_Start();                       // start PWM1
  PWM1_Set_Duty(0);        // Set current duty for PWM1
  
  while (1) {                         // endless loop

            if (UART1_Data_Ready()) { // If data has been received
            i = UART1_Read();     // read it
            //UART1_Write(i);       // and send it back
            PORTD=i;

           if(i<19){
            // PORTD=i;
            // PWM1_Set_Duty(200);
           //  Delay_ms(500);
           PORTC.B2=1;
             //PWM1_Set_Duty(0);
             }
             else if(i<30 && i>19){
              // PWM1_Set_Duty(800);
                PORTC.B2=1;
             Melody();
            // PWM1_Set_Duty(0);

             
             }
            else {
            //PORTD=0xFF;
             PORTC.B2=0;
            PORTE.B0=0;
            PWM1_Set_Duty(0);
            }
            
            
        }   else {
            PORTE.B0=0;
            //PWM1_Set_Duty(0);
            }



}

}