section .text
  global _resetDisk
  global _checkDriveStatus
  
_resetDisk:
   mov ah, 00h
   int 13h

_checkDriveStatus:
    mov ah, 01h
    int 13h
