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
; 1. Se verifica que estén todos los ejecutables (no se verifican dependencias adicionales de momento)
; 2. Se limpian las entradas de registro preexistentes para evitar conflictos con las versiones existentes
; 3. Se modifica el directorio de datos para openMSX para que los datos persistentes sean portables
; 4. Se ejecuta Catapult propiamente dicho
; 5. Al finalizar la ejecución se borran las entradas de registro del sistema y se sale del portabilizador
;
;; <======================================================================================================>


; 1. Verifico presencia de los ejecutables openmsx+catapult (si falta alguno se muestra un error)

ficheros_var() ; Nombre de la función que verifica la presencia de los archivos

Func ficheros_var()

if not FileExists(".\Catapult\bin\catapult.exe") or not FileExists("openmsx.exe") then

	    MsgBox($MB_ICONERROR, "OPENMSX.EXE AND OR CATAPULT NOT FOUND", "SOME EXECUTABLES ARE MISSING" & @CRLF & @CRLF & "" & "RUN THIS TOOL IN THE SAME FOLDER AS OPENMSX")
	    Exit
   Else
	    EndIf

EndFunc ; Fin de la función


; 2. Borro llaves de registro de openMSX anteriores a fin de evitar conflictos antes de ejecutar Catapult

RegDelete ("HKEY_CURRENT_USER\Software\openMSX team")


; 3. Establecemos ruta de trabajo de openmsx en donde se crearán los directorios del perfil de usuario

EnvSet ("USERPROFILE", @WorkingDir)


; 4. Ejecución de catapult (frontend de openmsx)

RunWait (".\Catapult\bin\catapult.exe", "", @SW_SHOW )


; 5. Borrado de llaves de registro anteriores tras finalizar ejecución

RegDelete ("HKEY_CURRENT_USER\Software\openMSX team")

Exit ; Salida del programa
