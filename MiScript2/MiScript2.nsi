;Include Modern UI

  !include "MUI2.nsh"

;--------------------------------
;General
  
  ;Nombre y archivo
  Name "MiScript2"
  OutFile "instalador2.exe"

  ;Default installation folder
  InstallDir "$LOCALAPPDATA\Mi Script 2\"
  
  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "Software\Mi Script 2\" ""

  ;Privilegios
  RequestExecutionLevel user

;--------------------------------
;Configuracion de la interfaz

  !define MUI_ICON "icon.ico"
  !define MUI_HEADERIMAGE
  !define MUI_HEADERIMAGE_BITMAP "C:\Program Files (x86)\NSIS\Contrib\Graphics\Header\nsis3-vintage.bmp" ; optional
  !define MUI_ABORTWARNING

;--------------------------------
;Páginas

  !insertmacro MUI_PAGE_LICENSE "${NSISDIR}\Docs\Modern UI\License.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  !insertmacro MUI_PAGE_INSTFILES
  
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES
  
;--------------------------------
;Lenguajes
 
  ;!insertmacro MUI_LANGUAGE "English"
  !insertmacro MUI_LANGUAGE "Spanish"

;--------------------------------
;Installer Sections

Section "Seccion 1" SecDummy

  SetOutPath "$INSTDIR"
  
  ;ADD YOUR OWN FILES HERE...
  
  ;Store installation folder
  WriteRegStr HKCU "Software\Mi Script 2\" "" $INSTDIR
  
  ;Create uninstaller
  WriteUninstaller "$INSTDIR\Uninstall.exe"

SectionEnd

;--------------------------------
;Descriptions

  ;Language strings
  LangString DESC_SecDummy ${LANG_ENGLISH} "Seccion de prueba"

  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecDummy} $(DESC_SecDummy)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END
 
;--------------------------------
;Uninstaller Section

Section "Desinstalar"

  ;ADD YOUR OWN FILES HERE...

  Delete "$INSTDIR\Uninstall.exe"

  RMDir "$INSTDIR"

  DeleteRegKey /ifempty HKCU "Software\Mi Script 2\"

SectionEnd