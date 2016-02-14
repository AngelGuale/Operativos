
_InitMain:

;PFmicroSensor.c,11 :: 		void InitMain() {
;PFmicroSensor.c,12 :: 		ANSEL  = 0x00;                          // Configure AN0 & AN1 pins as analog, the rest digital
	CLRF       ANSEL+0
;PFmicroSensor.c,13 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;PFmicroSensor.c,14 :: 		C1ON_bit = 0;                       // Disable comparators
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;PFmicroSensor.c,15 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;PFmicroSensor.c,17 :: 		PORTA = 0;
	CLRF       PORTA+0
;PFmicroSensor.c,18 :: 		TRISA = 0;                        // configure PORTA pins as input
	CLRF       TRISA+0
;PFmicroSensor.c,19 :: 		PORTB = 255;                          // set PORTC to 0
	MOVLW      255
	MOVWF      PORTB+0
;PFmicroSensor.c,20 :: 		TRISB = 255;
	MOVLW      255
	MOVWF      TRISB+0
;PFmicroSensor.c,21 :: 		TRISC = 0x00;                          // designate PORTC pins as output
	CLRF       TRISC+0
;PFmicroSensor.c,23 :: 		PORTC = 0;                          // set PORTC to 0
	CLRF       PORTC+0
;PFmicroSensor.c,24 :: 		TRISD=0;
	CLRF       TRISD+0
;PFmicroSensor.c,25 :: 		PORTD=0;
	CLRF       PORTD+0
;PFmicroSensor.c,27 :: 		UART1_Init(19200);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;PFmicroSensor.c,29 :: 		T1CON = 0b00100000;
	MOVLW      32
	MOVWF      T1CON+0
;PFmicroSensor.c,31 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;PFmicroSensor.c,32 :: 		INTCON.PEIE = 1;
	BSF        INTCON+0, 6
;PFmicroSensor.c,33 :: 		INTCON.RBIE = 1;
	BSF        INTCON+0, 3
;PFmicroSensor.c,34 :: 		INTCON.RBIF = 0;
	BCF        INTCON+0, 0
;PFmicroSensor.c,36 :: 		IOCB.IOCB0 = 1;
	BSF        IOCB+0, 0
;PFmicroSensor.c,37 :: 		}
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

;PFmicroSensor.c,39 :: 		void interrupt()
;PFmicroSensor.c,41 :: 		T1CON.TMR1ON = 1; // ON Counter
	BSF        T1CON+0, 0
;PFmicroSensor.c,42 :: 		while(Echo == 1);
L_interrupt0:
	BTFSS      PORTB+0, 0
	GOTO       L_interrupt1
	GOTO       L_interrupt0
L_interrupt1:
;PFmicroSensor.c,43 :: 		T1CON.TMR1ON = 0;
	BCF        T1CON+0, 0
;PFmicroSensor.c,44 :: 		TMR = (unsigned int)TMR1H << 8;
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
;PFmicroSensor.c,45 :: 		TMR = TMR + TMR1L; // Combine 2x counter byte into single integer
	MOVF       TMR1L+0, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVF       R0+0, 0
	MOVWF      _TMR+0
	MOVF       R0+1, 0
	MOVWF      _TMR+1
;PFmicroSensor.c,46 :: 		duration = (TMR/10) * 8;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_U+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	RLF        R4+0, 1
	RLF        R4+1, 1
	BCF        R4+0, 0
	RLF        R4+0, 1
	RLF        R4+1, 1
	BCF        R4+0, 0
	RLF        R4+0, 1
	RLF        R4+1, 1
	BCF        R4+0, 0
	MOVF       R4+0, 0
	MOVWF      R0+0
	MOVF       R4+1, 0
	MOVWF      R0+1
	CALL       _Word2Double+0
	MOVF       R0+0, 0
	MOVWF      _duration+0
	MOVF       R0+1, 0
	MOVWF      _duration+1
	MOVF       R0+2, 0
	MOVWF      _duration+2
	MOVF       R0+3, 0
	MOVWF      _duration+3
;PFmicroSensor.c,47 :: 		distance_cm = duration / 58 ;
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
;PFmicroSensor.c,48 :: 		PORTD=distance_cm;
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
;PFmicroSensor.c,49 :: 		if(distance_cm < 50 ) // If Ultrasonic sense less than 50cm
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      132
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
	GOTO       L_interrupt2
;PFmicroSensor.c,52 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_interrupt3:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt3
	DECFSZ     R12+0, 1
	GOTO       L_interrupt3
	DECFSZ     R11+0, 1
	GOTO       L_interrupt3
;PFmicroSensor.c,53 :: 		mensaje=10;
	MOVLW      10
	MOVWF      _mensaje+0
;PFmicroSensor.c,54 :: 		UART1_Write(mensaje);
	MOVLW      10
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;PFmicroSensor.c,56 :: 		}
	GOTO       L_interrupt4
L_interrupt2:
;PFmicroSensor.c,61 :: 		mensaje=100;
	MOVLW      100
	MOVWF      _mensaje+0
;PFmicroSensor.c,62 :: 		UART1_Write(mensaje);
	MOVLW      100
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;PFmicroSensor.c,64 :: 		}
L_interrupt4:
;PFmicroSensor.c,65 :: 		INTCON.RBIF = 0;
	BCF        INTCON+0, 0
;PFmicroSensor.c,67 :: 		}
L_end_interrupt:
L__interrupt12:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;PFmicroSensor.c,69 :: 		void main() {
;PFmicroSensor.c,70 :: 		InitMain();
	CALL       _InitMain+0
;PFmicroSensor.c,72 :: 		current_duty  = 128;                 // initial value for current_duty
	MOVLW      128
	MOVWF      _current_duty+0
;PFmicroSensor.c,75 :: 		while (1) {                         // endless loop
L_main5:
;PFmicroSensor.c,76 :: 		TMR1H = 0; // Clear Timer1
	CLRF       TMR1H+0
;PFmicroSensor.c,77 :: 		TMR1L = 0;
	CLRF       TMR1L+0
;PFmicroSensor.c,78 :: 		if (Echo==0) {                    // button on RA0 pressed
	BTFSC      PORTB+0, 0
	GOTO       L_main7
;PFmicroSensor.c,79 :: 		delay_us(40);
	MOVLW      26
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	NOP
;PFmicroSensor.c,80 :: 		Trig= 0;
	BCF        PORTA+0, 0
;PFmicroSensor.c,81 :: 		delay_us(2);
	NOP
	NOP
	NOP
	NOP
;PFmicroSensor.c,82 :: 		Trig = 1;
	BSF        PORTA+0, 0
;PFmicroSensor.c,83 :: 		delay_us(10); // Send LOW-to-HIGH Pulse of 10us to Ultrasonic
	MOVLW      6
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	NOP
;PFmicroSensor.c,84 :: 		Trig= 0;
	BCF        PORTA+0, 0
;PFmicroSensor.c,85 :: 		}
L_main7:
;PFmicroSensor.c,86 :: 		}
	GOTO       L_main5
;PFmicroSensor.c,87 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
