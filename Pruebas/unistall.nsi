; This script shows how to make your applicaton uninstallable

;--------------------------------

; The name of the installer
Name "Unistall"

; The file to write
OutFile "uninstallable_setup.exe"

; The default installation directory
InstallDir $PROGRAMFILES\UninstallableSetup\

; The text to prompt the user to enter a directory
DirText "This will install My Cool Program on your computer. Choose a directory"

;--------------------------------

; The stuff to install
Section "" ;No components page, name is not important

; Set output path to the installation directory.
SetOutPath $INSTDIR

; Put a file there
File Example1.exe

; Tell the compiler to write an uninstaller and to look for a "Uninstall" section
WriteUninstaller $INSTDIR\Uninstall.exe

SectionEnd ; end the section

; The uninstall section
Section "Uninstall"

Delete $INSTDIR\Uninstall.exe
Delete $INSTDIR\Example1.exe
RMDir $INSTDIR

SectionEnd