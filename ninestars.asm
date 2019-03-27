; 
; FILENAME:     ninestars.asm
; CREATED BY:   Brian Hart
; DATE:         13 Nov 2018
; PURPOSE:      Print 9 stars on the screen along with a simple message
; COMMENTS:     This is to understand registers better.  I am following the 
;               Assembly Quick Guide on TutorialsPoint.com in creating this program.
;

section .text
    global _start                               ; must be declared for linker (ld)
   
_start:                                         ; tell linker entry point
    ; Display the message explaining that the program will display the 9 stars
    mov edx,len                                 ; count of characters to be written
    mov ecx,msg                                 ; message to write (character pointer to first element)
    mov ebx,1                                   ; STDOUT file descriptor
    mov eax,4                                   ; system call number (sys_write)
    int 0x80                                    ; call kernel
    
    ; Display the 9 stars on the screen
    mov edx,9                                   ; count of characters to be written
    mov ecx,s2                                  ; character pointer to first element of array to write
    mov ebx,1                                   ; STDOUT file descriptor
    mov eax,4                                   ; system call number (sys_write)
    int 0x80                                    ; call kernel
    
    ; Print the newline in the 'crlf' variable
    mov edx,2                                   ; count of characters to be written
    mov ecx,crlf                                ; character pointer to first element of array to write
    mov ebx,1                                   ; STDOUT file descriptor
    mov eax,4                                   ; system call number (sys_write)
    int 0x80                                    ; call kernel    

    ; Display the 9 stars on the screen
    mov edx,s3len                               ; count of characters to be written
    mov ecx,s3                                  ; character pointer to first element of array to write
    mov ebx,1                                   ; STDOUT file descriptor
    mov eax,4                                   ; system call number (sys_write)
    int 0x80                                    ; call kernel
            
    ; Exit this process with exit code zero
    mov ebx,0                                   ; process exit code
    mov eax,1                                   ; system call number (sys_exit)
    int 0x80                                    ; call kernel
    ret                                         ; done
    
section .data                                   ; static data
    msg db  'Displaying 9 stars',0xA,0x0        ; a message
    len equ $-msg                               ; length of the message
    s2  times 9 db '*'                          ; s2 is a string with a '*' repeated 9 times
    crlf db 0xA,0x0                             ; a newline by itself
    s3  times   9   db  '*',0xA,0               ; s3 is a string with a '*', and '\n' repeated 9 times, 
                                                ; should print 1 star on each of nine lines
    s3len   equ $-s3                            ; length of the s3 message
    
section .bss                                    ; dynamically-changed variables
    ; TODO: Add dynamically-changed variables here
