; MSU1 asm by Conn, 06/06/15
; use on F-Zero (US) no header



lorom

org $00F88A 
JSL $02c1cd   ; hook to msu
NOP
    
org $00f8A9
JSL $02c1cd                 
NOP
NOP
NOP
NOP
NOP

org $008006  
JSL $02c2e0 ; hook to msu reset
NOP
NOP

org $02c1cd

LDA $2002      ;check if msu found
CMP #$53               
BEQ msufound   
LDA $46        ; play spc if no msu
STA $2140
RTL      
  
msufound: 
LDA $45
bpl continue
LDA $46
AND #$8f
STA $46
BNE continue
STZ $2006
continue:
LDA $46
BNE $04
STA $2140
RTL
AND #$F0
beq msu
LDA $0182
CMP #$01
BNE $06
LDA $46
STA $2140
RTL
LDA $46
AND #$F0
STA $2140
cmp #$80
bne end
STZ $2006     ; mute
end:
LDA $46
RTL

msu:
LDA $46
AND #$0f
CMP $0180    ; check if msu already plays
BNE newtrack
LDA $0182    ; check spc fallback
cmp #$01
BNE $07
LDA $46
STA $2140
BRA $05
LDA #$00      ;mute spc          
STA $2140 
LDA $46
RTL

newtrack: 
LDA $0181     ;check "MSU1 busy pending" flag
CMP #$01
BEQ checkmsuready
JSR trackselector
STA $2004     ; play msu track
STZ $2005 
STZ $2007
STZ $0182     ; clear spc fallback flag
LDA #$01      ;set "MSU1 busy pending" flag
STA $0181
LDA $46
RTL
 
checkmsuready:
BIT $2000 
BVS end2       ; if not ready loop
STZ $0181     ; clear msu busy flag
LDA $46
AND #$0f
STA $0180     ; set flag msu playing
JSR loopselector     ; select loop/non-loop track
STA $2007 
LDA $0180
CMP #$08
BNE $05
STZ $2006
Bra $05
LDA #$FF      ; full volume, change FF->60 when playing in bsnes in case the volume is too loud       
STA $2006

LDA $2000     ; testerrorbit
AND #$08      ; check error bit for spc fallback (only featured bsnes 0.8 and higher as well as sdnes)
BNE playspc       
end2:
LDA #$00      ;mute spc          
STA $2140 
LDA $46
RTL

playspc:        ; only if msu track not found
STZ $2006  
LDA #$01        ; set spc fallback flag
STA $0182
LDA $46  
STA $2140  
RTL       


loopselector:   ; select if track is looped. All tracks which are sfx are not looped: http://www.smwcentral.net/?p=viewthread&t=6665
LDA $46
AND #$0f
CMP #$01
BEQ noloop
CMP #$02
BEQ noloop
CMP #$03
BEQ noloop
LDA #$03
RTS
noloop:
LDA #$01
RTS

trackselector:
LDA $46
AND #$0f
cmp #$06
beq $01
rts
LDA $58
BEQ grandprix
LDA $53
TAX
LDA $02c2c9,x
rts

grandprix:
LDA $F2
CLC
ADC $53
TAX
LDA $02c2d0,x
rts

org $02c2c9
db $0e,$06,$0f,$10,$0a,$0b,$0d

org $02c2d0
db $0e,$06,$0f,$10,$0a,$0e,$0d,$08,$0b,$0c,$0e,$10,$0d,$08,$09

org $02c2e0
STZ $4200
STZ $420B
STZ $2006
STZ $2007
STZ $2004
LDA #$55
STA $0180
STA $0181
STA $0182
RTL


