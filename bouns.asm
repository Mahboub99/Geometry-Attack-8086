include MACROS.inc

.model small


.stack 64
.386
.data 

BGC EQU   13
Tri EQU   14
LIMIT_X EQU 160
Cir  EQU  12
SQR  EQU  9
REC  EQU  3 
RMB  EQU  2
TIME_AUX DB 0 ;variable used when checking if the time has changed

Score_Message DB 'score: '
Health_Massage DB 'Health: '

Score DB '0'
Health DB '9'

PLAYER1 DB  BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC ,BGC
		DB  BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC , 00 , 00 , 00 , 00 , 00 , 00 , 00 , 00 , 00 , BGC , BGC , BGC , BGC ,BGC
		DB  BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC , 00 , 00 , 00 , 00 , 00 , 00 , 00 , 00 , 00 , BGC , BGC , BGC , BGC ,BGC
		DB  BGC , BGC , BGC , BGC , BGC , BGC , BGC , 00 , 00 , 00 , 00 , 00 , 00 , 00 , 00 , 00 , 00 , 00 , 00 , 00 , BGC ,BGC
		DB  BGC , BGC , BGC , BGC , BGC , BGC , 00 , 10 , 00 , 00 , 00 , 00 , 00 , 10 , 00 , 00 , 00 , 00 , 10 , 10 , 00 ,BGC
		DB  BGC , BGC , BGC , BGC , BGC , BGC , 00 , 10 , 00 , 00 , 00 , 00 , 00 , 10 , 00 , 00 , 00 , 00 , 10 , 10 , 00 ,BGC
		DB  BGC , BGC , BGC , BGC , BGC , BGC , 00 , 10 , 10 , 10 , 00 , 10 , 10 , 10 , 10 , 00 , 00 , 10 , 10 , 10 , 00 ,BGC
		DB  BGC , BGC , BGC , BGC , BGC , BGC , 00 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 00 ,BGC
		DB  BGC , BGC , BGC , BGC , BGC , BGC , 00 , 00 , 00 , 00 , 00 , 00 , 00 , 00 , 14 , 14 , 14 , 14 , 00 , 00 , BGC ,BGC
		DB  BGC , BGC , BGC , BGC , BGC , BGC , 00 , 00 , 00 , 00 , 00 , 00 , 00 , 00 , 14 , 14 , 14 , 14 , 00 , 00 , BGC ,BGC
		DB  BGC , BGC , BGC , BGC , BGC , BGC , BGC , 00 , 00 , 00 , 00 , 14 , 14 , 00 , 14 , 00 , 00 , 14 , 00 , 00 , BGC ,BGC
		DB  BGC , BGC , BGC , BGC , BGC , BGC , BGC , 00 , 10 , 10 , 10 , 14 , 14 , 14 , 14 , 00 , 00 , 14 , 00 , 00 , BGC ,BGC
		DB  BGC , BGC , BGC , BGC , BGC , BGC , BGC , 00 , 10 , 10 , 10 , 10 , 10 , 14 , 14 , 14 , 14 , 14 , 00 , 00 , BGC ,BGC
		DB  BGC , BGC , BGC , BGC , BGC , BGC , BGC , 00 , 10 , 10 , 10 , 10 , 10 , 14 , 14 , 14 , 14 , 14 , 00 , 00 , BGC ,BGC
		DB  BGC , BGC , BGC , BGC , BGC , BGC , 00 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 00 , 00 , BGC ,BGC
		DB  BGC , BGC , BGC , BGC , 00 , 00 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 00 , 00 , 00 , BGC , BGC , BGC ,BGC
		DB  BGC , BGC , BGC , BGC , 00 , 00 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 10 , 00 , 00 , 00 , BGC , BGC , BGC ,BGC
		DB  BGC , BGC , BGC , BGC , 00 , 00 , 10 , 10 , 10 , 10 , 10 , 00 , 00 , 00 , 00 , 10 , 10 , 00 , BGC , BGC , BGC ,BGC
		DB  BGC , BGC , BGC , 00 , 10 , 10 , 10 , 10 , 14 , 14 , 14 , 00 , 00 , 00 , 00 , 00 , 00 , BGC , BGC , BGC , BGC ,BGC
		DB  BGC , BGC , BGC , 00 , 10 , 10 , 10 , 10 , 14 , 14 , 14 , 00 , 00 , 00 , 00 , BGC , BGC , BGC , BGC , BGC , BGC ,BGC
		DB  BGC , BGC , BGC , 00 , 10 , 10 , 10 , 10 , 00 , 00 , 00 , 00 , 00 , 00 , 00 , BGC , BGC , BGC , BGC , BGC , BGC ,BGC
		DB  BGC , 00 , 00 , 10 , 10 , 10 , 10 , 00 , 00 , 00 , 10 , 10 , 10 , 10 , 10 , 00 , 00 , BGC , BGC , BGC , BGC ,BGC
		DB  BGC , 00 , 10 , 10 , 00 , 00 , 00 , BGC , BGC , BGC , 00 , 00 , 00 , 00 , 00 , BGC , BGC , BGC , BGC , BGC , BGC ,BGC
		DB  BGC , 00 , 00 , 00 , 00 , 00 , 00 , BGC , BGC , BGC , 00 , 00 , 00 , 00 , 00 , BGC , BGC , BGC , BGC , BGC , BGC ,BGC
		DB  BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC , BGC ,BGC




       PLAYER_X DW  10				;X position of the first player
	   PLAYER_Y DW  90
       D_X  DW 00                   ;change in x direction
       D_Y  DW 00                   ;change in y ditecttion 
       X_L  DW 320
	   Y_L  DW 150
	   PLAYER_WIDTH DW 22 			;size of the player in X direction
	   PLAYER_HIGHT DW 25 			;size of the player in Y direction
	   PLAYER_VELOCITY_X DW 1     	;X (horizontal) velocity of the player
	   PLAYER_VELOCITY_Y DW 1    	;Y (vertical) velocity of the player
	   PLAYER_OUTER_VELOCITY DW 10
		

TRIANGLE DB BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
		 DB	BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
		 DB BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,Tri,Tri,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
		 DB	BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,Tri,Tri,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
		 DB	BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,Tri,Tri,Tri,Tri,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
		 DB	BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,Tri,Tri,Tri,Tri,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
		 DB	BGC,BGC,BGC,BGC,BGC,BGC,BGC,Tri,Tri,Tri,Tri,Tri,Tri,BGC,BGC,BGC,BGC,BGC,BGC,BGC
		 DB	BGC,BGC,BGC,BGC,BGC,BGC,BGC,Tri,Tri,Tri,Tri,Tri,Tri,BGC,BGC,BGC,BGC,BGC,BGC,BGC
		 DB	BGC,BGC,BGC,BGC,BGC,BGC,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,BGC,BGC,BGC,BGC,BGC,BGC
		 DB	BGC,BGC,BGC,BGC,BGC,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,BGC,BGC,BGC,BGC,BGC
		 DB	BGC,BGC,BGC,BGC,BGC,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,BGC,BGC,BGC,BGC,BGC
		 DB	BGC,BGC,BGC,BGC,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,BGC,BGC,BGC,BGC
		 DB	BGC,BGC,BGC,BGC,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,BGC,BGC,BGC,BGC
		 DB	BGC,BGC,BGC,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,BGC,BGC,BGC
		 DB	BGC,BGC,BGC,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,BGC,BGC,BGC
		 DB	BGC,BGC,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,Tri,BGC,BGC
		 DB	BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC		

        TRI_X DW 320
		TRI_Y DW 100
	    TRI_WIDEH DW  20
	    TRI_HIGHT Dw  17
		
CIRCLE  DB  BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
		DB	BGC,BGC,BGC,BGC,BGC,BGC,Cir,Cir,Cir,Cir,Cir,Cir,Cir,BGC,BGC,BGC,BGC,BGC,BGC,BGC
		DB	BGC,BGC,BGC,BGC,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,BGC,BGC,BGC,BGC,BGC
		DB	BGC,BGC,BGC,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,BGC,BGC,BGC,BGC
		DB	BGC,BGC,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,BGC,BGC,BGC
		DB	BGC,BGC,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,BGC,BGC
		DB	BGC,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,BGC,BGC
		DB	BGC,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,BGC
		DB	BGC,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,BGC
		DB	BGC,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,BGC
		DB	BGC,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,BGC
		DB	BGC,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,BGC
		DB	BGC,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,BGC
		DB	BGC,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,BGC,BGC
		DB	BGC,BGC,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,BGC,BGC
		DB	BGC,BGC,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,BGC,BGC,BGC
		DB	BGC,BGC,BGC,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,BGC,BGC,BGC,BGC
		DB	BGC,BGC,BGC,BGC,BGC,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,Cir,BGC,BGC,BGC,BGC,BGC
		DB	BGC,BGC,BGC,BGC,BGC,BGC,Cir,Cir,Cir,Cir,Cir,Cir,Cir,BGC,BGC,BGC,BGC,BGC,BGC,BGC
		DB	BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC		
        
        CIR_X DW 320
		CIR_Y DW 0
	    CIR_WIDEH DW  20
	    CIR_HIGHT Dw  20


SQUARE  DB  BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
		DB	BGC,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,BGC
		DB	BGC,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,BGC
		DB	BGC,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,BGC
		DB	BGC,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,BGC
		DB	BGC,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,BGC
		DB	BGC,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,BGC
		DB	BGC,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,BGC
		DB	BGC,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,BGC
		DB	BGC,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,BGC
		DB	BGC,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,BGC
		DB	BGC,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,BGC
		DB	BGC,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,BGC
		DB	BGC,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,BGC
		DB	BGC,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,BGC
		DB	BGC,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,BGC
		DB	BGC,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,BGC
		DB	BGC,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,BGC
		DB	BGC,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,Sqr,BGC
		DB	BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
 		
         
        SQR_X DW 320
		SQR_Y DW 135
	    SQR_WIDEH DW  20
	    SQR_HIGHT Dw  20
		
RECTANGLE   DB  BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
			DB	BGC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,BGC
			DB	BGC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,BGC
			DB	BGC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,BGC
			DB	BGC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,BGC
			DB	BGC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,BGC
			DB	BGC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,BGC
			DB	BGC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,BGC
			DB	BGC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,BGC
			DB	BGC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,BGC
			DB	BGC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,BGC
			DB	BGC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,BGC
			DB	BGC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,BGC
			DB	BGC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,BGC
			DB	BGC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,BGC
			DB	BGC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,BGC
			DB	BGC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,BGC
			DB	BGC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,REC,BGC
			DB	BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
			DB	BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
						
 
            REC_X DW 320
			REC_Y DW 50
			REC_WIDEH DW  46
			REC_HIGHT Dw  20  
			
			
RHOMBUS     DB  BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
			DB	BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
			DB	BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,RMB,RMB,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
			DB	BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,RMB,RMB,RMB,RMB,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
			DB	BGC,BGC,BGC,BGC,BGC,BGC,BGC,RMB,RMB,RMB,RMB,RMB,RMB,BGC,BGC,BGC,BGC,BGC,BGC,BGC
			DB	BGC,BGC,BGC,BGC,BGC,BGC,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,BGC,BGC,BGC,BGC,BGC,BGC
			DB	BGC,BGC,BGC,BGC,BGC,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,BGC,BGC,BGC,BGC,BGC
			DB	BGC,BGC,BGC,BGC,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,BGC,BGC,BGC,BGC
			DB	BGC,BGC,BGC,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,BGC,BGC,BGC
			DB	BGC,BGC,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,BGC,BGC
			DB	BGC,BGC,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,BGC,BGC
			DB	BGC,BGC,BGC,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,BGC,BGC,BGC
			DB	BGC,BGC,BGC,BGC,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,BGC,BGC,BGC,BGC
			DB	BGC,BGC,BGC,BGC,BGC,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,BGC,BGC,BGC,BGC,BGC
			DB	BGC,BGC,BGC,BGC,BGC,BGC,RMB,RMB,RMB,RMB,RMB,RMB,RMB,RMB,BGC,BGC,BGC,BGC,BGC,BGC
			DB	BGC,BGC,BGC,BGC,BGC,BGC,BGC,RMB,RMB,RMB,RMB,RMB,RMB,BGC,BGC,BGC,BGC,BGC,BGC,BGC
			DB	BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,RMB,RMB,RMB,RMB,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
			DB	BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,RMB,RMB,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
			DB	BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
			DB	BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC,BGC
							
	        RMB_X DW 320
			RMB_Y DW 120
			RMB_WIDEH DW  20
			RMB_HIGHT Dw  20  		
	 
	 
	 
	;---------------------------------------------
	Shapes_X DW 5 DUP(0)
    Shapes_Y DW 5 DUP(0)
    chosen DW 1 	
	
	;---------------------------------------------
	
	;deal with file
	BCGBALLWidth         EQU 150
	BCGBALLHeight        EQU 73
	BCGBALLFilename      DB 'C1.bin', 0
	BCGBALLFilehandle    DW ?
	BCGBALLData          DB BCGBALLWidth*BCGBALLHeight dup(0)
	
	;---------------------------------------------
	
	COMMAND_GAME_NAME DB 'GEOMETRY ATTACK','$' ;15
	COMMAND_INSTRUCTIONS DB 'use W to go up S to go down','$'  ;27
	COMMAND_TRI   DB 'PRESS 0 For TRIANGLE','$'  ;20
	COMMAND_CIR   DB 'PRESS 1 For CIRCLE','$'    ;18
	COMMAND_SQR   DB 'PRESS 2 For SQUARE','$'    ;18
	COMMAND_REC   DB 'PRESS 3 For RECTANGLE','$' ;21
	COMMAND_RHM   DB 'PRESS 4 For RHOMBUS','$'   ;19
	
	COMMAND_GAME_OVER   DB 'GAME OVER :(','$'   ;12
	COMMAND_YOU_WIN     DB 'YOU WIN :)','$'     ;10
	;-----------------------------------------------
.code   

MAIN PROC FAR

    mov Ax,@DATA
	mov DS ,Ax
	mov ES ,AX
	
	Start:
	 Mov ah , 00h  ;change to vedio mode
	 Mov Al , 13h
	 int 10h
    
   ; interface:  
		    ; CALL OpenFile
			; CALL Readdata
			; LEA BX , BCGBALLData ; BL contains index at the current drawn pixel
			
			
			; mov CX,0
			; mov DX,0
			; mov AH,0ch
			
		; ; Drawing loop
		; drawLoop:
			; mov AL,[BX]
			; INT 10h 
			; INC CX
			; INC BX
			; cmp CX,BCGBALLWidth
		; JNE drawLoop 
			
			; mov CX , 0
			; INC DX
			; cmp DX , BCGBALLHeight
		; JNE drawLoop
			; call CloseFile
		
		; mov ah , 0h 
	    ; int 16h
		; cmp al ,'a'
		; je Choose_Shape
		; jmp interface
		 
	Choose_Shape:
	         Mov ah , 00h  ;change to vedio mode
			 Mov Al , 13h
			 int 10h
			 
			print COMMAND_GAME_NAME,15,13,1, BGC
			print COMMAND_INSTRUCTIONS,27,7,8, 8
			
			print COMMAND_TRI,20,10,14, Tri
			print COMMAND_CIR,18,10,16, Cir
			print COMMAND_SQR,18,10,18, SQR
			print COMMAND_REC,21,10,20, REC
			print COMMAND_RHM,19,10,22, RMB
	        
			; Mov ah , 00h  ;change to vedio mode
			; Mov Al , 13h
			; int 10h
		
			mov ah , 0h 
			int 16h
	        
            cmp al ,'0' 			
	        je choose_TRI
			
			cmp al ,'1' 			
	        je choose_CIR
			
			cmp al ,'2' 			
	        je choose_SQR
			
			cmp al ,'3' 			
	        je choose_REC
			
			cmp al ,'4' 			
	        je choose_RHM
			
			choose_TRI:
			   mov ax ,0 
			   mov chosen , ax 
			   jmp GAME 
			
            choose_CIR:
			   mov ax ,1 
			   mov chosen , ax 
			   jmp GAME 
			    			
			choose_SQR:
			   mov ax ,2 
			   mov chosen , ax 
			   jmp GAME 
			      
		    choose_REC:
			   mov ax ,3
			   mov chosen , ax 
			   jmp GAME
			   
			choose_RHM:
			   mov ax ,4 
			   mov chosen , ax 
			   jmp GAME 
			      	
	        jmp Choose_Shape
	
    GAME:	
	 Mov ah , 00h  ;change to vedio mode
	 Mov Al , 13h
	 int 10h
	 CALL INITIALIZE_SCREEN 
	 CLEAR 15 , 0 , 175 , 320 , 2
	 PRINT Score_Message,7,0,23, 2 ;message , size , x ,y , color
	 PRINT Health_Massage,8, 20 ,23 ,4 
	 CALL INITIALIZE_SCORE_HEALTH

INFINITE:
     
	 
	CHECK_TIME: 
	    MOV AH,2Ch ;get the system time
		INT 21h    ;CH = hour CL = minute DH = second DL = 1/100 seconds
		
		CMP DL,TIME_AUX  ;is the current time equal to the previous one(TIME_AUX)?
		JE CHECK_TIME    ;if it is the same, check again
						 ;if it's different, then draw, move, etc.
		
		MOV TIME_AUX,DL ;update time
	 
	 
	mov ax ,0
    DRAW PLAYER1, PLAYER_X, PLAYER_Y, PLAYER_WIDTH, PLAYER_HIGHT 
	CALL movePlayer1 
	 
    CALL MOVE_SHAPS
	
	CALL INCREASE_SCORE_DECREASE_HEALT   
	CALL INITIALIZE_SCORE_HEALTH
    
	mov al , health
    cmp al , '0' 
    je GAME_OVER
    mov al , score
	cmp al , '9'
    je You_Win	
	
    jmp INFINITE
	 
	GAME_OVER:
	 Mov ah , 00h  ;change to vedio mode
	 Mov Al , 13h
	 int 10h
     print COMMAND_GAME_OVER,12,14,13, 4
	
	 jmp end_all
	
    You_Win: 	
      Mov ah , 00h  ;change to vedio mode
	  Mov Al , 13h
	  int 10h
      print COMMAND_YOU_WIN,10,15,13, 2
	 
    end_all: 	
    ret
MAIN ENDP

;-----------------------------------------------

INITIALIZE_SCREEN PROC
	
	mov BH, BGC     ; color 
	mov AH, 06h    ; Scroll up function
	XOR AL, AL     ; Clear entire screen
	XOR CX, CX     ; Upper left corner CH=row, CL=column
	mov CX ,00
	
	mov DX, 184FH  ; lower right corner DH=row, DL=column 
    mov dl,4fh
	mov dh,15h
	INT 10H
	
	RET
INITIALIZE_SCREEN  ENDP
;-----------------------------------------------
movePlayer1 PROC NEAR
	
	   mov ah , 01h 
	   int 16h
	   
	   jz DEFAULT
	   
	   cmp al , 115
	   jz DOWN

       cmp al , 119
	   jz Up 
	   
	   jmp DEFAULT
	   
	   Up:
			
			mov ax , 0
			dec ax
			mov [D_Y],ax
			
			mov AX , PLAYER_Y
			cmp AX , 30
			
			JL DEFAULT
			
			jmp DONE
		DOWN:
			
		    mov ax , 0
			inc ax
			mov [D_Y],ax
			
			mov AX ,PLAYER_Y
			add AX ,PLAYER_HIGHT
			cmp AX , 165
			
			JA DEFAULT
			
			jmp DONE
		
	    DEFAULT: 
		    jmp DONEALL
	
	 
	    DONE:
	   
       

        mov cx ,00     ;intialize counter for change loop 
	
	;this loop moves the player pixel by Pixel
		Change:
				
				
				Draw PLAYER1 , (PLAYER_X) , (PLAYER_Y) ,PLAYER_WIDTH ,PLAYER_HIGHT

				mov SI , PLAYER_X
				add SI , D_X
				mov [PLAYER_X] , SI
				
				mov SI , PLAYER_Y
				add SI , D_Y
				mov [PLAYER_Y] , SI
				
				inc cx
				cmp cx , PLAYER_OUTER_VELOCITY
				je DONEALL
				
					
				jmp change 	   
				
		DONEALL:
	    ;CLEAR 11, OLD_X_Player1 ,OLD_Y_Player1, PLAYER_WIDTH,PLAYER_HIGHT
	    mov ax ,00
	    mov [D_X] ,ax
	    mov [D_Y] ,ax		
		
        ; clear keboard buffer
        mov ah,0ch
	    mov al,0
	    int 21h		
	   
		RET
movePlayer1 ENDP
;------------------------------------------------------
Move_Shaps Proc NEAR
    
	 mov DI ,offset Shapes_Y
	 mov SI ,offset Shapes_X
	 
     ;triangle 
     cmp tri_x , 0 
     jnz same_y	 
	 
	 ; randomize the y positions of the shaps 
	 clear bgc , tri_x ,tri_y , tri_wideh ,tri_hight
	 
	 mov ax ,0
	 mov dx ,0
	 
	 mov al , time_aux
	 add al , 40
	 div y_l
	 mov tri_y , dx
	 
   same_y: 
     
	;clear bgc , tri_x ,tri_y , tri_wideh ,tri_hight
	mov cx , 4
    lop_TRI:	
	  mov dx , 0           ;clear the rem of the div 
	 
	  mov ax , tri_x
	  dec ax 
      add ax , 320 
	  div  x_l
	 
	  mov [tri_x] ,dx
	 
	  DRAW TRIANGLE , TRI_X ,TRI_Y , TRI_WIDEH ,TRI_HIGHT
	  dec cx 
	  jnz lop_TRI
	 ; add SI ,2
    ;----------------------------------------------------------
	 ; circle 
	 
     cmp CIR_X , 0 
     jnz same_y2	 
	 
	 ; randomize the y positions of the shaps 
	 clear bgc , CIR_X ,CIR_Y , CIR_WIDEH ,CIR_HIGHT
	 
	 mov ax ,0
	 mov dx ,0
	 
	 mov al , time_aux
	 add al , 60
	 div y_l
	 mov CIR_Y , dx
	
   same_y2: 
     
	 ;clear bgc , CIR_X ,CIR_Y , CIR_WIDEH ,CIR_HIGHT
	 mov cx , 6  ; velocity
	lop_CIR:
	  mov dx , 0           ;clear the rem of the div 
	  mov ax , CIR_X
	  dec ax
      add ax , 320 
	  div  x_l
	 
	  mov [CIR_X] ,dx
	  
	  DRAW CIRCLE , CIR_X ,CIR_Y , CIR_WIDEH ,CIR_HIGHT
	  dec cx 
	  jnz lop_CIR
	  
	  
	;------------------------------------------------------------
	
	 ; SQUARE 
	 
     cmp SQR_X , 0 
     jnz same_y3	 
	 
	 ; randomize the y positions of the shaps 
	 clear bgc , SQR_X ,SQR_Y , SQR_WIDEH ,SQR_HIGHT
	 
	 mov ax ,0
	 mov dx ,0
	 
	 mov al , time_aux
	 add al , 50
	 div y_l
	 mov SQR_Y , dx
	 ;mov [DI]  , dx
   same_y3: 
     
	;clear bgc , SQR_X ,SQR_Y , SQR_WIDEH ,SQR_HIGHT
	 
	         
	  mov cx , 5
    lop_SQR:
	  mov dx , 0    ;clear the rem of the div 
	  mov ax , SQR_X
	  dec ax 
      add ax , 320 
	  div  x_l
	  
	  mov [SQR_X] ,dx
	  ;mov [SI]  , dx
	  DRAW SQUARE , SQR_X ,SQR_Y , SQR_WIDEH ,SQR_HIGHT
	  dec cx
	  jnz lop_SQR
	  
	 ;------------------------------------------------------------
	
	 ; RECTANGLE 
	 
     cmp REC_X , 0 
     jnz same_y4	 
	 
	 ; randomize the y positions of the shaps 
	 clear bgc , REC_X ,REC_Y , REC_WIDEH ,REC_HIGHT
	 
	 mov ax ,0
	 mov dx ,0
	 
	 mov al , time_aux
	 add al , 70
	 div y_l
	 mov REC_Y , dx
	 ;mov [DI]  , dx
   same_y4: 
     
	;clear bgc , SQR_X ,SQR_Y , SQR_WIDEH ,SQR_HIGHT
	 
	         
	  mov cx , 8
	  
    lop_REC:
	  mov dx , 0    ;clear the rem of the div 
	  mov ax , REC_X
	  dec ax 
      add ax , 320 
	  div  x_l
	  
	  mov [REC_X] ,dx
	  ;mov [SI]  , dx
	  
	  DRAW RECTANGLE , REC_X ,REC_Y , REC_WIDEH ,REC_HIGHT
	  dec cx
	  jnz lop_REC
    ;---------------------------------------------------------------
	
	 ; RHOMBUS 
	 
     cmp RMB_X , 0 
     jnz same_y5	 
	 
	 ; randomize the y positions of the shaps 
	 clear bgc , RMB_X ,RMB_Y , RMB_WIDEH ,RMB_HIGHT
	 
	 mov ax ,0
	 mov dx ,0
	 
	 mov al , time_aux
	 add al , 60
	 div y_l
	 mov RMB_Y , dx
	 ;mov [DI]  , dx
   same_y5: 
     
	;clear bgc , SQR_X ,SQR_Y , SQR_WIDEH ,SQR_HIGHT
	 
	         
	  mov cx , 2
	  
    lop_RMB:
	  mov dx , 0    ;clear the rem of the div 
	  mov ax , RMB_X
	  dec ax 
      add ax , 320 
	  div  x_l
	  
	  mov [RMB_X] ,dx
	  ;mov [SI]  , dx
	  DRAW RHOMBUS , RMB_X ,RMB_Y , RMB_WIDEH ,RMB_HIGHT
	  dec cx
	  jnz lop_RMB
	  
	RET
Move_Shaps EndP 
;----------------------------------------
INITIALIZE_SCORE_HEALTH Proc NEAR

   ;----------Score------
    mov DL, 7            ;COL
	mov DH, 23              ;ROW
	mov BH,0              ;PAGE
	mov AH,02H
	INT 10H               ;EXECUTE movE CURSOR
		
	mov BL,7              ;COLOR
	mov AL, Score

	
	mov AH,0EH            ;EXECUTE PRINTING
	INT 10H
	mov ax,1
	
	;--------Health--------
	mov DL, 28            ;COL
	mov DH, 23              ;ROW
	mov BH,0              ;PAGE
	mov AH,02H
	INT 10H               ;EXECUTE movE CURSOR
		
	mov BL,7              ;COLOR
	mov AL, Health
    

	mov AH,0EH            ;EXECUTE PRINTING
	INT 10H
	mov ax,1
	
	RET
INITIALIZE_SCORE_HEALTH EndP
;---------------------------------------------------------
INCREASE_SCORE_DECREASE_HEALT Proc 
   
  
   ; Do not forget to edit chosen shape
   mov SI , offset Shapes_X
   mov DI , offset Shapes_Y
   
   ;triangle
   mov ax ,TRI_X
   mov [SI],ax
   add SI ,2
   
   mov ax ,TRI_Y 
   mov [DI],ax
   add DI , 2 

   ;CIRCLE
   mov ax ,CIR_X
   mov [SI],ax
   add SI ,2
   
   mov ax ,CIR_Y
   mov [DI],ax
   add DI , 2 

  ;SQUARE
   mov ax ,SQR_X
   mov [SI],ax
   add SI ,2
   
   mov ax ,SQR_Y
   mov [DI],ax
   add DI , 2 
  
   ;RECTANGLE
   mov ax ,REC_X
   mov [SI],ax
   add SI ,2
   
   mov ax ,REC_Y
   mov [DI],ax
   add DI , 2 
  
   ;RHOMBUS
   mov ax ,RMB_X
   mov [SI],ax
   add SI ,2
   
   mov ax ,RMB_Y 
   mov [DI],ax
   add DI , 2 
 ;--------------------------------------
   mov SI , offset Shapes_X
   mov DI , offset Shapes_Y
   mov cx , 0 
   
   lop_shapes:
       
       mov ax , PLAYER_Y
       sub ax , 20
       cmp ax , [DI]	   
       JA After  
       
	   mov ax , PLAYER_Y 
	   add ax , PLAYER_HIGHT
	   cmp ax , [DI]
	   JB After 
       
       mov ax , PLAYER_X 
       add ax , PLAYER_WIDTH 
       cmp ax ,[SI]
       JB After 	   
       
	   choose:
	    
		cmp cx , 0 
           je TRIANGLE_SHAPE
        cmp cx , 1
           je CIRCLE_SHAPE	
		cmp cx , 2 
           je SQUARE_SHAPE
		cmp cx , 3 
           je RECTANGLE_SHAPE
		cmp cx , 4 
           je RHOMBUS_SHAPE
		
		TRIANGLE_SHAPE:
		
		      mov ax , 310
			  mov TRI_X , ax 
			  mov dx ,0
			  mov al , time_aux
			  add al , 40
			  div y_l
			  mov TRI_Y, dx
			 
              jmp choose_action
        CIRCLE_SHAPE:
		
		      mov ax , 310
			  mov CIR_X , ax 
			  mov dx ,0
			  mov al , time_aux
			  add al , 60
			  div y_l
			  mov CIR_Y , dx
			  
              jmp choose_action			  
		SQUARE_SHAPE:
	
              mov ax , 310
			  mov SQR_X , ax 
			  mov dx ,0
			  mov al , time_aux
			  add al , 50
			  div y_l
			  mov SQR_Y , dx
			  
              jmp choose_action  
        RECTANGLE_SHAPE:
		    
			  mov ax , 310
			  mov REC_X , ax 
			  mov dx ,0
			  mov al , time_aux
			  add al , 70
			  div y_l
			  mov REC_Y , dx
			 
              jmp choose_action		
        RHOMBUS_SHAPE:	
		  
		      mov ax , 310
			  mov RMB_X , ax 
			  mov dx ,0
			  mov al , time_aux
			  add al , 60
			  div y_l
			  mov RMB_Y , dx
			 
              jmp choose_action 
        
        choose_action: 
		  push cx
          CALL INITIALIZE_SCREEN 
          pop cx		 
		  
          mov ax , chosen
          cmp ax ,cx 
          je increase_score 
          
       Decrease_Health:
          
		  dec Health		 
          jmp After
		  
       increase_score:
          inc score
	  
	   After: 
        add SI ,2
		add DI ,2
		inc CX
		cmp CX ,5
		jne lop_Shapes
		
         RET 
INCREASE_SCORE_DECREASE_HEALT EndP
; ;---------------------------------------------------
OpenFile PROC 

		; Open file

		mov AH, 3Dh
		mov AL, 0 ; read only
		LEA DX, BCGBALLFilename
		INT 21h
		
		; you should check carry flag to make sure it worked correctly
		; carry = 0 -> successful , file handle -> AX
		; carry = 1 -> failed , AX -> error code
		 
		mov [BCGBALLFilehandle], AX
		RET

OpenFile ENDP
; ;-----------------------------------------------------------
Readdata PROC

		mov AH,3Fh
		mov BX, [BCGBALLFilehandle]
		mov CX,BCGBALLWidth*BCGBALLHeight ; number of bytes to read
		LEA DX, BCGBALLData
		INT 21h
		RET

Readdata ENDP 
; ;-----------------------------------------------------------
CloseFile PROC

		mov AH, 3Eh
		mov BX, [BCGBALLFilehandle]

		INT 21h
		RET

CloseFile ENDP
; ;-----------------------------------------------------------
END MAIN