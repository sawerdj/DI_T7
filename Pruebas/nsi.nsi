!include "MUI.nsh" 

Page license
Page components
Page directory
Page instfiles

;mostramos la página de bienvenida
!insertmacro MUI_PAGE_WELCOME

;Página donde mostramos el contrato de licencia
!insertmacro MUI_PAGE_LICENSE "Licencia.txt"

; Página donde se muestran las distintas secciones definidas
!insertmacro MUI_PAGE_COMPONENTS

;Página donde se selecciona el directorio donde instalar nuestra aplicación
!insertmacro MUI_PAGE_DIRECTORY

;Página de instalación de ficheros
!insertmacro MUI_PAGE_INSTFILES

;Página final
!insertmacro MUI_PAGE_FINISH

Section "Lanza Ayuda"
 SetOutPath $INSTDIR
 File "dist.rar"
 Nsis7z::Extract "dist.rar"
 Delete "$OUTDIR\dist.rar"
SectionEnd

Section "Installer Section"
SectionEnd
Section "Uninstaller Section"
SectionEnd

Function .onInit
  MessageBox MB_YESNO "This will install My Program. Do you wish to continue?" IDYES gogogo
    Abort
  gogogo:
FunctionEnd

Var ejemplo
 ;Declaramos la variable
 Function PruebaVar
 Var /GLOBAL ejemplo2
 StrCpy $ejemplo "valor"
 StrCpy $ejemplo2 "otro valor"
;ahora la variable ejemplo vale "valor" y la variable ejemplo2 vale "otro valor"
 FunctionEnd

 