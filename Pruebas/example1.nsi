
;--------------------------------

;Nombre del instalador
Name "Desarrollo de Interfaces"

;El archivo a escribir
OutFile "DesarrolloInterfaces1.exe"

;Privilegios (user, admin)
RequestExecutionLevel user

;Construccion unicode
Unicode True

;Donde lo va a instalar
InstallDir $PROGRAMFILES\DesarrolloInterfaces1

;--------------------------------

;Páginas

Page directory
Page instfiles

;--------------------------------

; The stuff to install
Section "" ;No components page, name is not important

  ; Set output path to the installation directory.
  SetOutPath $INSTDIR
  
  ; Put file there
  File DesarrolloInterfaces1.nsi
  
SectionEnd 
;final de secion
