;NSIS Modern User Interface
;Welcome/Finish Page Example Script
;Written by Joost Verburg

;--------------------------------
;Include Modern UI

  !include "MUI2.nsh"

;--------------------------------
;General

  ;Name and file
  Name "LanzaAyuda"
  OutFile "instalador_lanzaayuda.exe"
  Unicode True

  ;Default installation folder
  InstallDir "$LOCALAPPDATA\LanzaAyuda"

  ;Get installation folder from registry if available
  InstallDirRegKey HKCU "Software\LanzaAyuda" ""

  ;Request application privileges for Windows Vista
  RequestExecutionLevel user

;--------------------------------
;Interface Settings

  !define MUI_ABORTWARNING
  Var StartMenuFolder

;--------------------------------
;Pages

  !insertmacro MUI_PAGE_LICENSE "${NSISDIR}\Docs\Modern UI\License.txt"
  !insertmacro MUI_PAGE_COMPONENTS
  !insertmacro MUI_PAGE_DIRECTORY
  
  ;Start Menu Folder Page Configuration
  !define MUI_STARTMENUPAGE_REGISTRY_ROOT "HKCU" 
  !define MUI_STARTMENUPAGE_REGISTRY_KEY "Software\LanzaAyuda" 
  !define MUI_STARTMENUPAGE_REGISTRY_VALUENAME "Start Menu Folder"
  
  !insertmacro MUI_PAGE_STARTMENU Application $StartMenuFolder
  
  !insertmacro MUI_PAGE_INSTFILES
  
  !insertmacro MUI_UNPAGE_CONFIRM
  !insertmacro MUI_UNPAGE_INSTFILES

;--------------------------------
;Languages

  !insertmacro MUI_LANGUAGE "Spanish"

;--------------------------------
;Installer Sections

Section "Instalador LanzaAyuda" SecDummy

  SetOutPath "$INSTDIR"

  ;ADD YOUR OWN FILES HERE...
  File "dist.7z"
  Nsis7z::Extract "dist.7z"
  Delete "$OUTDIR\dist.7z"

  ;Store installation folder
  WriteRegStr HKCU "Software\LanzaAyuda" "" $INSTDIR

  ;Create uninstaller
  WriteUninstaller "$INSTDIR\UninstallLanzaAyuda.exe"
!insertmacro MUI_STARTMENU_WRITE_BEGIN Application
    
    ;Create shortcuts
    CreateDirectory "$SMPROGRAMS\$StartMenuFolder"
    CreateShortcut "$SMPROGRAMS\$StartMenuFolder\Uninstall_LanzaAyuda.lnk" "$INSTDIR\UninstallLanzaAyuda.exe"
    CreateShortcut "$SMPROGRAMS\$StartMenuFolder\LanzaAyuda.lnk" "$INSTDIR\dist\App_LanzaAyuda.jar"

  !insertmacro MUI_STARTMENU_WRITE_END
SectionEnd

;--------------------------------
;Descriptions

  ;Language strings
  LangString DESC_SecDummy ${LANG_SPANISH} "Una seccion de prueba"

  ;Assign language strings to sections
  !insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
    !insertmacro MUI_DESCRIPTION_TEXT ${SecDummy} $(DESC_SecDummy)
  !insertmacro MUI_FUNCTION_DESCRIPTION_END

;--------------------------------
;Uninstaller Section

Section "Uninstall"

  ;ADD YOUR OWN FILES HERE...
  ;Delete "$INSTDIR\lib\javahelp-2.0.05.jar"
  ;RMDir "$INSTDIR\lib"
  ;Delete "$INSTDIR\UninstallLanzaAyuda.exe"
  ;Delete "$INSTDIR\App_LanzaAyuda.jar"
  ;Delete "$INSTDIR\README.TXT"
  RMDir /r "$INSTDIR"

!insertmacro MUI_STARTMENU_GETFOLDER Application $StartMenuFolder

  Delete "$SMPROGRAMS\$StartMenuFolder\*.*"
  RMDir "$SMPROGRAMS\$StartMenuFolder\appLanzaAyuda"

  DeleteRegKey /ifempty HKCU "Software\LanzaAyuda"

SectionEnd