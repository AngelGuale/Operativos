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
 Sound_Play(440, 100);
}
 void Si_T() {
 Sound_Play(494, 100);
}

void Tone2() {
 Sound_Play(698, 250);
}

void Tone3() {
 Sound_Play(784, 250);
}

void Melody() {
 Si_T(); La_T();
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
Sound_Play(880, 500);

 PWM1_Init(900);

 UART1_Init(19200);
#line 79 "C:/Users/Usuario/Desktop/ProyectoFinal_Guante/ProyectoFinal_Guante.c"
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

 if(i<19){



 PORTC.B2=1;

 }
 else if(i<30 && i>19){

 PORTC.B2=1;
 Melody();



 }
 else {

 PORTC.B2=0;
 PORTE.B0=0;
 PWM1_Set_Duty(0);
 }


 } else {
 PORTE.B0=0;

 }



}

}
