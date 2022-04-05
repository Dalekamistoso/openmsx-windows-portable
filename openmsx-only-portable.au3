#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Compile_Both=y
#AutoIt3Wrapper_UseX64=y
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
; Oculto icono del script



; Funciones que voy a usar y otras que están planeadas de usar en futuras versiones

#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>
#include <MsgBoxConstants.au3>
#include <Constants.au3>
#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>
#include <file.au3>


; <==========================PROCESO QUE SE RALIZA EN LA EJECUCIÓN =======================================>
;
; 1. Se verifica que esté el ejecutable de openMSX (no se verifica Catapult ni dependencias adicionales)
; 2. Se modifica el directorio de datos para openMSX para que los datos persistentes sean portables
; 3. Se ejecuta openMSX propiamente dicho
;
;; <======================================================================================================>


; 1. Verifico presencia del ejecutable openmsx+catapult (si falta alguno se muestra un error)

ficheros_var() ; Nombre de la función que verifica la presencia de los archivos

Func ficheros_var()

if not FileExists ("openmsx.exe") then

	    MsgBox($MB_ICONERROR, "OPENMSX.EXE NOT FOUND", "OPENMSX MAIN EXECUTABLE IS MISSING" & @CRLF & @CRLF & "" & "RUN THIS TOOL IN THE SAME FOLDER AS OPENMSX")
	    Exit
   Else
	    EndIf

EndFunc ; Fin de la función


; 2. Establecemos ruta de trabajo de openmsx en donde se crearán los directorios del perfil de usuario

EnvSet ("USERPROFILE", @WorkingDir)


; 3. Ejecución de catapult (frontend de openmsx)

RunWait ("openmsx.exe", "", @SW_SHOW )


Exit ; Salida del programa
