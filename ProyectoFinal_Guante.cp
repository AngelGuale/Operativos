#line 1 "C:/Users/Usuario/Desktop/ProyectoFinal_Guante/ProyectoFinal_Guante.c"



unsigned short current_duty, old_duty, current_duty1, old_duty1;
unsigned int temp_res;
 unsigned int TMR;
 float duration ;
 float distance_cm ;
 unsigned char i;

void Tone1() {
 Sound_Play(659, 250);
}
 void Do_T() {
 Sound_Play(262, 250);
}
 void Re_T() {
 Sound_Play(294, 250);
} void Mi_T() {
 Sound_Play(330, 250);
}

 void Fa_T() {
 Sound_Play(349, 250);
} void Sol_T() {
 Sound_Play(392, 250);
} void La_T() {
 Sound_Play(440, 250);
}
 void Si_T() {
 Sound_Play(494, 250);
}

void Tone2() {
 Sound_Play(698, 250);
}

void Tone3() {
 Sound_Play(784, 250);
}

void Melody() {
 Do_T(); Re_T(); Do_T();
 }

void InitMain() {
 ANSEL = 0x00;
 ANSELH = 0;
 C1ON_bit = 0;
 C2ON_bit = 0;

 PORTA = 255;
 TRISA = 255;
 PORTB = 0;
 TRISB = 0;
 TRISC = 0xF0;

 PORTC = 0;
 TRISD=0;
 PORTD=0;

Sound_Init(&PORTE, 0);
Sound_Play(880, 1000);

 PWM1_Init(900);

 UART1_Init(19200);


T1CON = 0b00100000;

INTCON.GIE = 1;
INTCON.PEIE = 1;
INTCON.RBIE = 1;
INTCON.RBIF = 0;

IOCB.IOCB0 = 1;
}

void main() {
 InitMain();

 current_duty = 128;

 PWM1_Start();
 PWM1_Set_Duty(0);

 while (1) {


 if (UART1_Data_Ready()) {
 i = UART1_Read();


 PORTD=i;

 if(i<20){

 PORTD=i;
 PWM1_Set_Duty(200);
 Melody();
 PWM1_Set_Duty(0);


 }
 else {
 PORTD=0xFF;
 PORTE.B0=0;
 PWM1_Set_Duty(0);
 }
 }


}

}
