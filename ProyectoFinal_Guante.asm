
_Tone1:

;ProyectoFinal_Guante.c,11 :: 		void Tone1() {
;ProyectoFinal_Guante.c,12 :: 		Sound_Play(659, 250);   // Frequency = 659Hz, duration = 250ms
	MOVLW      147
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      250
	MOVWF      FARG_Sound_Play_duration_ms+0
	CLRF       FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;ProyectoFinal_Guante.c,13 :: 		}
L_end_Tone1:
	RETURN
; end of _Tone1

_Do_T:

;ProyectoFinal_Guante.c,14 :: 		void Do_T() {
;ProyectoFinal_Guante.c,15 :: 		Sound_Play(262, 250);   // Frequency = 659Hz, duration = 250ms
	MOVLW      6
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      250
	MOVWF      FARG_Sound_Play_duration_ms+0
	CLRF       FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;ProyectoFinal_Guante.c,16 :: 		}
L_end_Do_T:
	RETURN
; end of _Do_T

_Re_T:

;ProyectoFinal_Guante.c,17 :: 		void Re_T() {
;ProyectoFinal_Guante.c,18 :: 		Sound_Play(294, 250);   // Frequency = 659Hz, duration = 250ms
	MOVLW      38
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      250
	MOVWF      FARG_Sound_Play_duration_ms+0
	CLRF       FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;ProyectoFinal_Guante.c,19 :: 		} void Mi_T() {
L_end_Re_T:
	RETURN
; end of _Re_T

_Mi_T:

;ProyectoFinal_Guante.c,20 :: 		Sound_Play(330, 250);   // Frequency = 659Hz, duration = 250ms
	MOVLW      74
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      250
	MOVWF      FARG_Sound_Play_duration_ms+0
	CLRF       FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;ProyectoFinal_Guante.c,21 :: 		}
L_end_Mi_T:
	RETURN
; end of _Mi_T

_Fa_T:

;ProyectoFinal_Guante.c,23 :: 		void Fa_T() {
;ProyectoFinal_Guante.c,24 :: 		Sound_Play(349, 250);   // Frequency = 659Hz, duration = 250ms
	MOVLW      93
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      250
	MOVWF      FARG_Sound_Play_duration_ms+0
	CLRF       FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;ProyectoFinal_Guante.c,25 :: 		} void Sol_T() {
L_end_Fa_T:
	RETURN
; end of _Fa_T

_Sol_T:

;ProyectoFinal_Guante.c,26 :: 		Sound_Play(392, 250);   // Frequency = 659Hz, duration = 250ms
	MOVLW      136
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      250
	MOVWF      FARG_Sound_Play_duration_ms+0
	CLRF       FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;ProyectoFinal_Guante.c,27 :: 		} void La_T() {
L_end_Sol_T:
	RETURN
; end of _Sol_T

_La_T:

;ProyectoFinal_Guante.c,28 :: 		Sound_Play(440, 250);   // Frequency = 659Hz, duration = 250ms
	MOVLW      184
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      250
	MOVWF      FARG_Sound_Play_duration_ms+0
	CLRF       FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;ProyectoFinal_Guante.c,29 :: 		}
L_end_La_T:
	RETURN
; end of _La_T

_Si_T:

;ProyectoFinal_Guante.c,30 :: 		void Si_T() {
;ProyectoFinal_Guante.c,31 :: 		Sound_Play(494, 250);   // Frequency = 659Hz, duration = 250ms
	MOVLW      238
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      250
	MOVWF      FARG_Sound_Play_duration_ms+0
	CLRF       FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;ProyectoFinal_Guante.c,32 :: 		}
L_end_Si_T:
	RETURN
; end of _Si_T

_Tone2:

;ProyectoFinal_Guante.c,34 :: 		void Tone2() {
;ProyectoFinal_Guante.c,35 :: 		Sound_Play(698, 250);   // Frequency = 698Hz, duration = 250ms
	MOVLW      186
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      2
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      250
	MOVWF      FARG_Sound_Play_duration_ms+0
	CLRF       FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;ProyectoFinal_Guante.c,36 :: 		}
L_end_Tone2:
	RETURN
; end of _Tone2

_Tone3:

;ProyectoFinal_Guante.c,38 :: 		void Tone3() {
;ProyectoFinal_Guante.c,39 :: 		Sound_Play(784, 250);   // Frequency = 784Hz, duration = 250ms
	MOVLW      16
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      3
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      250
	MOVWF      FARG_Sound_Play_duration_ms+0
	CLRF       FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;ProyectoFinal_Guante.c,40 :: 		}
L_end_Tone3:
	RETURN
; end of _Tone3

_Melody:

;ProyectoFinal_Guante.c,42 :: 		void Melody() {           // Plays the melody "Yellow house"
;ProyectoFinal_Guante.c,43 :: 		Do_T(); Re_T(); Do_T();
	CALL       _Do_T+0
	CALL       _Re_T+0
	CALL       _Do_T+0
;ProyectoFinal_Guante.c,44 :: 		}
L_end_Melody:
	RETURN
; end of _Melody

_InitMain:

;ProyectoFinal_Guante.c,46 :: 		void InitMain() {
;ProyectoFinal_Guante.c,47 :: 		ANSEL  = 0x00;                          // Configure AN0 & AN1 pins as analog, the rest digital
	CLRF       ANSEL+0
;ProyectoFinal_Guante.c,48 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;ProyectoFinal_Guante.c,49 :: 		C1ON_bit = 0;                       // Disable comparators
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;ProyectoFinal_Guante.c,50 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;ProyectoFinal_Guante.c,52 :: 		PORTA = 255;
	MOVLW      255
	MOVWF      PORTA+0
;ProyectoFinal_Guante.c,53 :: 		TRISA = 255;                        // configure PORTA pins as input
	MOVLW      255
	MOVWF      TRISA+0
;ProyectoFinal_Guante.c,54 :: 		PORTB = 0;                          // set PORTC to 0
	CLRF       PORTB+0
;ProyectoFinal_Guante.c,55 :: 		TRISB = 0;
	CLRF       TRISB+0
;ProyectoFinal_Guante.c,56 :: 		TRISC = 0xF0;                          // designate PORTC pins as output
	MOVLW      240
	MOVWF      TRISC+0
;ProyectoFinal_Guante.c,58 :: 		PORTC = 0;                          // set PORTC to 0
	CLRF       PORTC+0
;ProyectoFinal_Guante.c,59 :: 		TRISD=0;
	CLRF       TRISD+0
;ProyectoFinal_Guante.c,60 :: 		PORTD=0;
	CLRF       PORTD+0
;ProyectoFinal_Guante.c,62 :: 		Sound_Init(&PORTE, 0);
	MOVLW      PORTE+0
	MOVWF      FARG_Sound_Init_snd_port+0
	CLRF       FARG_Sound_Init_snd_pin+0
	CALL       _Sound_Init+0
;ProyectoFinal_Guante.c,63 :: 		Sound_Play(880, 1000);             // Play sound at 880Hz for 1 second
	MOVLW      112
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      3
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      232
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      3
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;ProyectoFinal_Guante.c,65 :: 		PWM1_Init(900);                    // Initialize PWM1 module at 1KHz
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      138
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;ProyectoFinal_Guante.c,67 :: 		UART1_Init(19200);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;ProyectoFinal_Guante.c,70 :: 		T1CON = 0b00100000;
	MOVLW      32
	MOVWF      T1CON+0
;ProyectoFinal_Guante.c,72 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;ProyectoFinal_Guante.c,73 :: 		INTCON.PEIE = 1;
	BSF        INTCON+0, 6
;ProyectoFinal_Guante.c,74 :: 		INTCON.RBIE = 1;
	BSF        INTCON+0, 3
;ProyectoFinal_Guante.c,75 :: 		INTCON.RBIF = 0;
	BCF        INTCON+0, 0
;ProyectoFinal_Guante.c,77 :: 		IOCB.IOCB0 = 1;
	BSF        IOCB+0, 0
;ProyectoFinal_Guante.c,78 :: 		}
L_end_InitMain:
	RETURN
; end of _InitMain

_main:

;ProyectoFinal_Guante.c,80 :: 		void main() {
;ProyectoFinal_Guante.c,81 :: 		InitMain();
	CALL       _InitMain+0
;ProyectoFinal_Guante.c,83 :: 		current_duty  = 128;                 // initial value for current_duty
	MOVLW      128
	MOVWF      _current_duty+0
;ProyectoFinal_Guante.c,85 :: 		PWM1_Start();                       // start PWM1
	CALL       _PWM1_Start+0
;ProyectoFinal_Guante.c,86 :: 		PWM1_Set_Duty(0);        // Set current duty for PWM1
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;ProyectoFinal_Guante.c,88 :: 		while (1) {                         // endless loop
L_main0:
;ProyectoFinal_Guante.c,91 :: 		if (UART1_Data_Ready()) { // If data has been received
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main2
;ProyectoFinal_Guante.c,92 :: 		i = UART1_Read();     // read it
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _i+0
;ProyectoFinal_Guante.c,95 :: 		PORTD=i;
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;ProyectoFinal_Guante.c,97 :: 		if(i<20){
	MOVLW      20
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;ProyectoFinal_Guante.c,99 :: 		PORTD=i;
	MOVF       _i+0, 0
	MOVWF      PORTD+0
;ProyectoFinal_Guante.c,100 :: 		PWM1_Set_Duty(200);
	MOVLW      200
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;ProyectoFinal_Guante.c,101 :: 		Melody();
	CALL       _Melody+0
;ProyectoFinal_Guante.c,102 :: 		PWM1_Set_Duty(0);
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;ProyectoFinal_Guante.c,105 :: 		}
	GOTO       L_main4
L_main3:
;ProyectoFinal_Guante.c,107 :: 		PORTD=0xFF;
	MOVLW      255
	MOVWF      PORTD+0
;ProyectoFinal_Guante.c,108 :: 		PORTE.B0=0;
	BCF        PORTE+0, 0
;ProyectoFinal_Guante.c,109 :: 		PWM1_Set_Duty(0);
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;ProyectoFinal_Guante.c,110 :: 		}
L_main4:
;ProyectoFinal_Guante.c,111 :: 		}
L_main2:
;ProyectoFinal_Guante.c,114 :: 		}
	GOTO       L_main0
;ProyectoFinal_Guante.c,116 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
