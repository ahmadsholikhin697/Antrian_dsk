.model small
.code
org 100h
start:
    
    jmp mulai
nama        db 13,10,'Nama                 : $'
nomor       db 13,10,'Nomor Hp             : $'
lanjut      db 13,10,'Tekan y untuk lanjut>>> $'
tampung_nama        db 30,?,30 dup(?)
tampung_nomor       db 13,?,13 dup(?)

a db 01
b db 02
c db 03
d db 04
e db 05
f db 06
g db 07
h db 08
i db 09
j dw 15

daftar  db 13,10,'+-----------------------+'
        db 13,10,'|  Pilih nomor antrian  |'
        db 13,10,'+-----------------------+'
        db 13,10,'|  Kode |      Jam      |'
        db 13,10,'+Antrian|    Antrian    +'
        db 13,10,'+-----------------------|'
        db 13,10,'|   01  |     08:00     |'
        db 13,10,'+-----------------------|'
        db 13,10,'|   02  |     08:45     |'
        db 13,10,'+-----------------------|'
        db 13,10,'|   03  |     09:30     |'
        db 13,10,'+-----------------------|'
        db 13,10,'|   04  |     10:15     |'
        db 13,10,'+-----------------------|'
        db 13,10,'|   05  |     11:00     |'
        db 13,10,'+-----------------------|'
        db 13,10,'|   06  |     11:45     |'
        db 13,10,'+-----------------------|'
        db 13,10,'|   07  |     13:00     |'
        db 13,10,'+-----------------------|'
        db 13,10,'|   08  |     13:45     |'
        db 13,10,'+-----------------------|'
        db 13,10,'|   09  |     14:30     |'
        db 13,10,'+-----------------------|'
        db 13,10,'|   10  |     15:15     |'
        db 13,10,'+-----------------------|'
        db 13,10,'|   11  |     16:00     |'
        db 13,10,'+-----------------------|','$'




error       db 13,10,'Yang and masukan salah $'

pilih_spt   db 13,10,'Silahkan pilih Kodenya : $'
succes      db 13,10,'Selamat anda berhasil $'

mulai:
    mov ah,09h
    lea dx,nama
    int 21h
    mov ah,0ah
    lea dx,tampung_nama
    int 21h
    push dx

    mov ah,09h
    lea dx,nomor
    int 21h
    mov ah,0ah
    lea dx,tampung_nomor
    int 21h
    push dx

    mov ah,09h
    mov dx,offset daftar
    int 21h
    mov ah,09h
    mov dx,offset lanjut
    int 21h
    mov ah,01h
    int 21h
    cmp al,'y'
    je proses
    jne error_nsg

error_nsg:
    mov ah,09h
    mov dx,offset error
    int 21h
    int 20h
    
sys_date:
    mov ah,2ah
    int 21h
    
    mov yer,cx
    mov mth,dh
    mov day,dl
    mov dow,al
cek_1:
    mov ah,9
    lea dx,koma
    int 21h
    call cek_tanggal
cek_2:
    call cek_bulan
cek_4:
    mov ah,9
    lea dx,baris
    int 21h
    
;variabel simpan
day db ?
dow db ?
mth db ?
yer dw ?

baris db 0ah,0dh,'$'
koma db ', $'
ttk2 db ' :$'

;Procedure
;kondisi cek
cek_tanggal proc
    xor ax,ax
    mov al,day
    mov bl,10
    div bl
    
    mov a,al
    mov b,ah
    xor ax,ax
    xor bx,bx
    
    mov al,a
    shl bl,4
    or bl,al
    mov al,b
    or bl,al
    
    jmp cek_2
cek_bulan proc
    cmp mth,01h
    cmp mth,02h
    cmp mth,03h
    cmp mth,04h
    cmp mth,05h
    cmp mth,06h
    cmp mth,07h
    cmp mth,08h
    cmp mth,09h
    cmp mth,10h
    cmp mth,11h
    cmp mth,12h
    
pnggl_thn proc
    mov cx,4
    mov ax,yer
    mov bl,10
bagi_thn:
    div bl
    push ax
    mov ah,08
    
    loop bagi_thn
    mov cx,4
pop_thn:
    pop dx
    mov dl,dh
    add dl,30h
    mov ah,2
    int 21h
    loop pop_thn
    jmp cek_4


proses:
    mov ah,09h
    mov dx,offset pilih_spt
    int 21h

    mov ah,1
    int 21h
    mov bh,al
    mov ah,1
    int 21h
    mov bl,al
    cmp bh,'0'
    cmp bl,'1'
    je hasil1

    cmp bh,'0'
    cmp bl,'2'
    je hasil2


    cmp bh,'0'
    cmp bl,'3'
    je hasil3


    cmp bh,'0'
    cmp bl,'4'
    je hasil4
    
    cmp bh,'0'
    cmp bl,'5'
    je hasil5
    
    
    cmp bh,'0'
    cmp bl,'6'
    je hasil6
             
             
    cmp bh,'0'
    cmp bl,'7'
    je hasil7
             
             
    cmp bh,'0'
    cmp bl,'8'
    je hasil8
             
             
    cmp bh,'0'
    cmp bl,'9'
    je hasil9
             
             
    cmp bh,'0'
    je hasil10
    
    
    cmp bh,'0'
    je hasil11


;--------------------------------------------------------------------------

hasil1:
    mov ah,09h
    lea dx,teks1
    int 21h
    int 20h

hasil2:
    mov ah,09h
    lea dx,teks2
    int 21h
    int 20h

hasil3:
    mov ah,09h
    lea dx,teks3
    int 21h
    int 20h

hasil4:
    mov ah,09h
    lea dx,teks4
    int 21h
    int 20h
    
hasil5:
    mov ah,09h
    lea dx,teks5
    int 21h
    int 20h

hasil6:
    mov ah,09h
    lea dx,teks6
    int 21h
    int 20h

hasil7:
    mov ah,09h
    lea dx,teks7
    int 21h
    int 20h

hasil8:
    mov ah,09h
    lea dx,teks8
    int 21h
    int 20h

hasil9:
    mov ah,09h
    lea dx,teks9
    int 21h
    int 20h

hasil10:
    mov ah,09h
    lea dx,teks10
    int 21h
    int 20h

hasil11:
    mov ah,09h
    lea dx,teks11
    int 21h
    int 20h

;--------------------------------------------------------------------------

teks1       db 13,10,'                                       '
        db 13,10,'Nomor Antrian'
        db 13,10,'     01      '
        db 13,10,'    08:00     '
        db 13,10,'  Teler UAD  $'

    
teks2       db 13,10,'                                       '
        db 13,10,'Nomor Antrian'
        db 13,10,'     02      '
        db 13,10,'    08:45    '
        db 13,10,'  Teler UAD  $' 

teks3       db 13,10,'                                       '
        db 13,10,'Nomor Antrian'
        db 13,10,'     03      '
        db 13,10,'    09:30    '
        db 13,10,'  Teler UAD  $' 

teks4       db 13,10,'                                       '
        db 13,10,'Nomor Antrian'
        db 13,10,'     04      '
        db 13,10,'    10:15    '
        db 13,10,'  Teler UAD  $'
        
teks5       db 13,10,'                                       '
        db 13,10,'Nomor Antrian'
        db 13,10,'     05      '
        db 13,10,'    11:00    '
        db 13,10,'  Teler UAD  $'
       
teks6       db 13,10,'                                       '
        db 13,10,'Nomor Antrian'
        db 13,10,'     06      '
        db 13,10,'    11:45    '
        db 13,10,'  Teler UAD  $'
       
teks7       db 13,10,'                                       '
        db 13,10,'Nomor Antrian'
        db 13,10,'     07      '
        db 13,10,'    13:00    '
        db 13,10,'  Teler UAD  $'
        
teks8       db 13,10,'                                       '
        db 13,10,'Nomor Antrian'
        db 13,10,'     08      '
        db 13,10,'    13:45    ' 
        db 13,10,'  Teler UAD  $'
        
teks9       db 13,10,'                                       '
        db 13,10,'Nomor Antrian'
        db 13,10,'     09      '
        db 13,10,'    14:30    ' 
        db 13,10,'  Teler UAD  $'
        
teks10       db 13,10,'                                       '
        db 13,10,'Nomor Antrian'
        db 13,10,'     10      '
        db 13,10,'    15:15    ' 
        db 13,10,'  Teler UAD  $'
        
teks11       db 13,10,'                                       '
        db 13,10,'Nomor Antrian'
        db 13,10,'     11      '
        db 13,10,'    16:00    ' 
        db 13,10,'  Teler UAD  $'

end start