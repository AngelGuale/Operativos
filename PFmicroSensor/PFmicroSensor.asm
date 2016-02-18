
_enviaMensaje:

;PFmicroSensor.c,16 :: 		void enviaMensaje(unsigned char s1, unsigned char s2){
;PFmicroSensor.c,17 :: 		if(s1==1 && s2==0){
	MOVF       FARG_enviaMensaje_s1+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_enviaMensaje2
	MOVF       FARG_enviaMensaje_s2+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_enviaMensaje2
L__enviaMensaje27:
;PFmicroSensor.c,18 :: 		mensaje=10;
	MOVLW      10
	MOVWF      _mensaje+0
;PFmicroSensor.c,19 :: 		UART1_Write(mensaje);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;PFmicroSensor.c,20 :: 		}
L_enviaMensaje2:
;PFmicroSensor.c,21 :: 		if(s2==1){
	MOVF       FARG_enviaMensaje_s2+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_enviaMensaje3
;PFmicroSensor.c,22 :: 		mensaje=20;
	MOVLW      20
	MOVWF      _mensaje+0
;PFmicroSensor.c,23 :: 		UART1_Write(mensaje);
	MOVLW      20
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;PFmicroSensor.c,24 :: 		}
L_enviaMensaje3:
;PFmicroSensor.c,25 :: 		if(s1==0 && s2==0){
	MOVF       FARG_enviaMensaje_s1+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_enviaMensaje6
	MOVF       FARG_enviaMensaje_s2+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_enviaMensaje6
L__enviaMensaje26:
;PFmicroSensor.c,26 :: 		mensaje=100;
	MOVLW      100
	MOVWF      _mensaje+0
;PFmicroSensor.c,27 :: 		UART1_Write(mensaje);
	MOVLW      100
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;PFmicroSensor.c,29 :: 		}
L_enviaMensaje6:
;PFmicroSensor.c,32 :: 		}
L_end_enviaMensaje:
	RETURN
; end of _enviaMensaje

_InitMain:

;PFmicroSensor.c,34 :: 		void InitMain() {
;PFmicroSensor.c,35 :: 		ANSEL  = 0x00;                          // Configure AN0 & AN1 pins as analog, the rest digital
	CLRF       ANSEL+0
;PFmicroSensor.c,36 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;PFmicroSensor.c,37 :: 		C1ON_bit = 0;                       // Disable comparators
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;PFmicroSensor.c,38 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;PFmicroSensor.c,40 :: 		PORTA = 0;
	CLRF       PORTA+0
;PFmicroSensor.c,41 :: 		TRISA = 0;                        // configure PORTA pins as input
	CLRF       TRISA+0
;PFmicroSensor.c,42 :: 		PORTB = 255;                          // set PORTC to 0
	MOVLW      255
	MOVWF      PORTB+0
;PFmicroSensor.c,43 :: 		TRISB = 255;
	MOVLW      255
	MOVWF      TRISB+0
;PFmicroSensor.c,44 :: 		TRISC = 0x00;                          // designate PORTC pins as output
	CLRF       TRISC+0
;PFmicroSensor.c,46 :: 		PORTC = 0;                          // set PORTC to 0
	CLRF       PORTC+0
;PFmicroSensor.c,47 :: 		TRISD=0;
	CLRF       TRISD+0
;PFmicroSensor.c,48 :: 		PORTD=0;
	CLRF       PORTD+0
;PFmicroSensor.c,49 :: 		TRISE=0;
	CLRF       TRISE+0
;PFmicroSensor.c,50 :: 		PORTE=0;
	CLRF       PORTE+0
;PFmicroSensor.c,52 :: 		UART1_Init(19200);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;PFmicroSensor.c,54 :: 		T1CON = 0b00100000;
	MOVLW      32
	MOVWF      T1CON+0
;PFmicroSensor.c,56 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;PFmicroSensor.c,57 :: 		INTCON.PEIE = 1;
	BSF        INTCON+0, 6
;PFmicroSensor.c,58 :: 		INTCON.RBIE = 1;
	BSF        INTCON+0, 3
;PFmicroSensor.c,59 :: 		INTCON.RBIF = 0;
	BCF        INTCON+0, 0
;PFmicroSensor.c,61 :: 		IOCB.IOCB1 = 1;
	BSF        IOCB+0, 1
;PFmicroSensor.c,63 :: 		INTCON.INTE = 1;
	BSF        INTCON+0, 4
;PFmicroSensor.c,64 :: 		INTCON.INTF = 0;
	BCF        INTCON+0, 1
;PFmicroSensor.c,65 :: 		}
L_end_InitMain:
	RETURN
; end of _InitMain

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;PFmicroSensor.c,67 :: 		void interrupt()
;PFmicroSensor.c,69 :: 		T1CON.TMR1ON = 1; // ON Counter
	BSF        T1CON+0, 0
;PFmicroSensor.c,70 :: 		INTCON.GIE = 0;
	BCF        INTCON+0, 7
;PFmicroSensor.c,72 :: 		if(INTCON.INTF==0){
	BTFSC      INTCON+0, 1
	GOTO       L_interrupt7
;PFmicroSensor.c,73 :: 		while(Echo == 1  );
L_interrupt8:
	BTFSS      PORTB+0, 1
	GOTO       L_interrupt9
	GOTO       L_interrupt8
L_interrupt9:
;PFmicroSensor.c,74 :: 		T1CON.TMR1ON = 0;
	BCF        T1CON+0, 0
;PFmicroSensor.c,75 :: 		TMR = (unsigned int)TMR1H << 8;
	MOVF       TMR1H+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	MOVF       R3+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       R0+0, 0
	MOVWF      _TMR+0
	MOVF       R0+1, 0
	MOVWF      _TMR+1
;PFmicroSensor.c,76 :: 		TMR = TMR + TMR1L; // Combine 2x counter byte into single integer
	MOVF       TMR1L+0, 0
	ADDWF      R0+0, 0
	MOVWF      R3+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R3+1
	MOVF       R3+0, 0
	MOVWF      _TMR+0
	MOVF       R3+1, 0
	MOVWF      _TMR+1
;PFmicroSensor.c,77 :: 		duration = (TMR*2);
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	CALL       _Word2Double+0
	MOVF       R0+0, 0
	MOVWF      _duration+0
	MOVF       R0+1, 0
	MOVWF      _duration+1
	MOVF       R0+2, 0
	MOVWF      _duration+2
	MOVF       R0+3, 0
	MOVWF      _duration+3
;PFmicroSensor.c,78 :: 		distance_cm = duration / 58 ;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      104
	MOVWF      R4+2
	MOVLW      132
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FLOC__interrupt+0
	MOVF       R0+1, 0
	MOVWF      FLOC__interrupt+1
	MOVF       R0+2, 0
	MOVWF      FLOC__interrupt+2
	MOVF       R0+3, 0
	MOVWF      FLOC__interrupt+3
	MOVF       FLOC__interrupt+0, 0
	MOVWF      _distance_cm+0
	MOVF       FLOC__interrupt+1, 0
	MOVWF      _distance_cm+1
	MOVF       FLOC__interrupt+2, 0
	MOVWF      _distance_cm+2
	MOVF       FLOC__interrupt+3, 0
	MOVWF      _distance_cm+3
;PFmicroSensor.c,79 :: 		PORTD=distance_cm;
	MOVF       FLOC__interrupt+0, 0
	MOVWF      R0+0
	MOVF       FLOC__interrupt+1, 0
	MOVWF      R0+1
	MOVF       FLOC__interrupt+2, 0
	MOVWF      R0+2
	MOVF       FLOC__interrupt+3, 0
	MOVWF      R0+3
	CALL       _Double2Byte+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;PFmicroSensor.c,80 :: 		if(distance_cm < 15 ) // If Ultrasonic sense less than 50cm
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      112
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	MOVF       FLOC__interrupt+0, 0
	MOVWF      R0+0
	MOVF       FLOC__interrupt+1, 0
	MOVWF      R0+1
	MOVF       FLOC__interrupt+2, 0
	MOVWF      R0+2
	MOVF       FLOC__interrupt+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt10
;PFmicroSensor.c,84 :: 		alerta_sensor1=1;
	MOVLW      1
	MOVWF      _alerta_sensor1+0
;PFmicroSensor.c,85 :: 		enviaMensaje(alerta_sensor1, alerta_sensor2);
	MOVLW      1
	MOVWF      FARG_enviaMensaje_s1+0
	MOVF       _alerta_sensor2+0, 0
	MOVWF      FARG_enviaMensaje_s2+0
	CALL       _enviaMensaje+0
;PFmicroSensor.c,87 :: 		}
	GOTO       L_interrupt11
L_interrupt10:
;PFmicroSensor.c,90 :: 		alerta_sensor1=0;
	CLRF       _alerta_sensor1+0
;PFmicroSensor.c,91 :: 		enviaMensaje(alerta_sensor1, alerta_sensor2);
	CLRF       FARG_enviaMensaje_s1+0
	MOVF       _alerta_sensor2+0, 0
	MOVWF      FARG_enviaMensaje_s2+0
	CALL       _enviaMensaje+0
;PFmicroSensor.c,93 :: 		}
L_interrupt11:
;PFmicroSensor.c,94 :: 		INTCON.RBIF = 0;
	BCF        INTCON+0, 0
;PFmicroSensor.c,96 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;PFmicroSensor.c,97 :: 		TMR1H = 0; // Clear Timer1
	CLRF       TMR1H+0
;PFmicroSensor.c,98 :: 		TMR1L = 0;
	CLRF       TMR1L+0
;PFmicroSensor.c,101 :: 		return;
	GOTO       L__interrupt31
;PFmicroSensor.c,102 :: 		}else if(INTCON.INTF==1){
L_interrupt7:
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt13
;PFmicroSensor.c,103 :: 		while(Echo2 == 1 );
L_interrupt14:
	BTFSS      PORTB+0, 0
	GOTO       L_interrupt15
	GOTO       L_interrupt14
L_interrupt15:
;PFmicroSensor.c,104 :: 		T1CON.TMR1ON = 0;
	BCF        T1CON+0, 0
;PFmicroSensor.c,105 :: 		TMR = (unsigned int)TMR1H << 8;
	MOVF       TMR1H+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	MOVF       R3+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       R0+0, 0
	MOVWF      _TMR+0
	MOVF       R0+1, 0
	MOVWF      _TMR+1
;PFmicroSensor.c,106 :: 		TMR = TMR + TMR1L; // Combine 2x counter byte into single integer
	MOVF       TMR1L+0, 0
	ADDWF      R0+0, 0
	MOVWF      R3+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R3+1
	MOVF       R3+0, 0
	MOVWF      _TMR+0
	MOVF       R3+1, 0
	MOVWF      _TMR+1
;PFmicroSensor.c,107 :: 		duration = (TMR*2);
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	CALL       _Word2Double+0
	MOVF       R0+0, 0
	MOVWF      _duration+0
	MOVF       R0+1, 0
	MOVWF      _duration+1
	MOVF       R0+2, 0
	MOVWF      _duration+2
	MOVF       R0+3, 0
	MOVWF      _duration+3
;PFmicroSensor.c,108 :: 		distance_cm = duration / 58 ;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      104
	MOVWF      R4+2
	MOVLW      132
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FLOC__interrupt+0
	MOVF       R0+1, 0
	MOVWF      FLOC__interrupt+1
	MOVF       R0+2, 0
	MOVWF      FLOC__interrupt+2
	MOVF       R0+3, 0
	MOVWF      FLOC__interrupt+3
	MOVF       FLOC__interrupt+0, 0
	MOVWF      _distance_cm+0
	MOVF       FLOC__interrupt+1, 0
	MOVWF      _distance_cm+1
	MOVF       FLOC__interrupt+2, 0
	MOVWF      _distance_cm+2
	MOVF       FLOC__interrupt+3, 0
	MOVWF      _distance_cm+3
;PFmicroSensor.c,109 :: 		PORTD=distance_cm;
	MOVF       FLOC__interrupt+0, 0
	MOVWF      R0+0
	MOVF       FLOC__interrupt+1, 0
	MOVWF      R0+1
	MOVF       FLOC__interrupt+2, 0
	MOVWF      R0+2
	MOVF       FLOC__interrupt+3, 0
	MOVWF      R0+3
	CALL       _Double2Byte+0
	MOVF       R0+0, 0
	MOVWF      PORTD+0
;PFmicroSensor.c,110 :: 		if(distance_cm > 7 ) // If Ultrasonic sense less than 50cm
	MOVF       FLOC__interrupt+0, 0
	MOVWF      R4+0
	MOVF       FLOC__interrupt+1, 0
	MOVWF      R4+1
	MOVF       FLOC__interrupt+2, 0
	MOVWF      R4+2
	MOVF       FLOC__interrupt+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      96
	MOVWF      R0+2
	MOVLW      129
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt16
;PFmicroSensor.c,112 :: 		alerta_sensor2=1;
	MOVLW      1
	MOVWF      _alerta_sensor2+0
;PFmicroSensor.c,113 :: 		enviaMensaje(alerta_sensor1, alerta_sensor2);
	MOVF       _alerta_sensor1+0, 0
	MOVWF      FARG_enviaMensaje_s1+0
	MOVLW      1
	MOVWF      FARG_enviaMensaje_s2+0
	CALL       _enviaMensaje+0
;PFmicroSensor.c,115 :: 		}
	GOTO       L_interrupt17
L_interrupt16:
;PFmicroSensor.c,118 :: 		alerta_sensor2=0;
	CLRF       _alerta_sensor2+0
;PFmicroSensor.c,119 :: 		enviaMensaje(alerta_sensor1, alerta_sensor2);
	MOVF       _alerta_sensor1+0, 0
	MOVWF      FARG_enviaMensaje_s1+0
	CLRF       FARG_enviaMensaje_s2+0
	CALL       _enviaMensaje+0
;PFmicroSensor.c,122 :: 		}
L_interrupt17:
;PFmicroSensor.c,123 :: 		INTCON.INTF = 0;
	BCF        INTCON+0, 1
;PFmicroSensor.c,125 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;PFmicroSensor.c,126 :: 		TMR1H = 0; // Clear Timer1
	CLRF       TMR1H+0
;PFmicroSensor.c,127 :: 		TMR1L = 0;
	CLRF       TMR1L+0
;PFmicroSensor.c,129 :: 		}
L_interrupt13:
;PFmicroSensor.c,132 :: 		}
L_end_interrupt:
L__interrupt31:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;PFmicroSensor.c,134 :: 		void main() {
;PFmicroSensor.c,135 :: 		InitMain();
	CALL       _InitMain+0
;PFmicroSensor.c,137 :: 		current_duty  = 128;                 // initial value for current_duty
	MOVLW      128
	MOVWF      _current_duty+0
;PFmicroSensor.c,140 :: 		while (1) {                         // endless loop
L_main18:
;PFmicroSensor.c,141 :: 		TMR1H = 0; // Clear Timer1
	CLRF       TMR1H+0
;PFmicroSensor.c,142 :: 		TMR1L = 0;
	CLRF       TMR1L+0
;PFmicroSensor.c,143 :: 		PORTE.B0=alerta_sensor1;
	BTFSC      _alerta_sensor1+0, 0
	GOTO       L__main33
	BCF        PORTE+0, 0
	GOTO       L__main34
L__main33:
	BSF        PORTE+0, 0
L__main34:
;PFmicroSensor.c,144 :: 		PORTE.B1=alerta_sensor2;
	BTFSC      _alerta_sensor2+0, 0
	GOTO       L__main35
	BCF        PORTE+0, 1
	GOTO       L__main36
L__main35:
	BSF        PORTE+0, 1
L__main36:
;PFmicroSensor.c,146 :: 		if (Echo==0) {
	BTFSC      PORTB+0, 1
	GOTO       L_main20
;PFmicroSensor.c,147 :: 		delay_us(40);
	MOVLW      26
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	NOP
;PFmicroSensor.c,148 :: 		Trig= 0;
	BCF        PORTA+0, 0
;PFmicroSensor.c,149 :: 		delay_us(2);
	NOP
	NOP
	NOP
	NOP
;PFmicroSensor.c,150 :: 		Trig = 1;
	BSF        PORTA+0, 0
;PFmicroSensor.c,151 :: 		delay_us(10); // Send LOW-to-HIGH Pulse of 10us to Ultrasonic
	MOVLW      6
	MOVWF      R13+0
L_main22:
	DECFSZ     R13+0, 1
	GOTO       L_main22
	NOP
;PFmicroSensor.c,152 :: 		Trig= 0;
	BCF        PORTA+0, 0
;PFmicroSensor.c,153 :: 		}
L_main20:
;PFmicroSensor.c,155 :: 		if (Echo2==0) {
	BTFSC      PORTB+0, 0
	GOTO       L_main23
;PFmicroSensor.c,156 :: 		delay_us(40);
	MOVLW      26
	MOVWF      R13+0
L_main24:
	DECFSZ     R13+0, 1
	GOTO       L_main24
	NOP
;PFmicroSensor.c,157 :: 		Trig2= 0;
	BCF        PORTA+0, 1
;PFmicroSensor.c,158 :: 		delay_us(2);
	NOP
	NOP
	NOP
	NOP
;PFmicroSensor.c,159 :: 		Trig2 = 1;
	BSF        PORTA+0, 1
;PFmicroSensor.c,160 :: 		delay_us(10); // Send LOW-to-HIGH Pulse of 10us to Ultrasonic
	MOVLW      6
	MOVWF      R13+0
L_main25:
	DECFSZ     R13+0, 1
	GOTO       L_main25
	NOP
;PFmicroSensor.c,161 :: 		Trig2= 0;
	BCF        PORTA+0, 1
;PFmicroSensor.c,162 :: 		}
L_main23:
;PFmicroSensor.c,164 :: 		}
	GOTO       L_main18
;PFmicroSensor.c,165 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
