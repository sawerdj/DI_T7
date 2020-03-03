;Include Modern UI

  !include "MUI2.nsh"

;--------------------------------
;General
  !define MUI_ICON "server.png"
  !define MUI_HEADERIMAGE
  !define MUI_HEADERIMAGE_BITMAP "InstallerLogo.bmp"
  !define MUI_HEADERIMAGE_RIGHT
  
  ;Nombre y archivo
  Name "MiScript2"
  OutFile "MiScript2.exe"

  ;Default installation folder
  InstallDir "$LOCALAPPDATA\Modern UI Test\Unicode"
  
  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "Software\Modern UI Test\Unicode" ""

  ;Privilegios
  RequestExecutionLevel user

;--------------------------------
;Configuracion de la interfaz

  !define MUI_HEADERIMAGE
  !define MUI_HEADERIMAGE_BITMAP "${NSISDIR}\Contrib\Graphics\Header\nsis.bmp" ; optional
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
  WriteRegStr HKCU "Software\Modern UI Test\Unicode" "" $INSTDIR
  
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

  DeleteRegKey /ifempty HKCU "Software\Modern UI Test\Unicode"

SectionEnd