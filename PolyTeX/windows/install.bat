@REM Modifier le cas echeant le repertoire de la distribution MiKTeX
@REM Attention pour MiKTeX 1.20 le repertoire habituel est
@REM "c:\texmf" et pour MikTeX 2.0 "c:\Program Files\MiKTeX"
@REM
@SET TEXMF="c:\Program Files\MiKTeX"
@REM
@SET WINEDT="c:\Program Files\WinEdt"
@REM
@REM %%%%%%%% Ne rien modifier apres cette ligne %%%%%%%%%
@REM
@if exist %TEXMF%\tex\latex\base\latex.ltx goto install 
@echo Le repertoire %TEXMF% n'est pas celui de votre distribution MikTeX
@echo L'installation de PolyteX ne peut pas continuer
@goto fin
:install
@echo Installation des fichiers de style PolyTeX (et autres) dans %TEXMF%
@xcopy /E /Y /Q ..\texmf %TEXMF%
@echo Installation des commandes dans %TEXMF%\miktex\bin
@xcopy /Y /Q bin\*.* %TEXMF%\miktex\bin
@echo Mise a jour de la base de donnees des fichiers de MikteX
@initexmf --update-fndb
:fin
@if not exist %WINEDT%\WinEdt.exe goto exit
@copy winedt\polytexMenu.dat %WINEDT%
@%WINEDT%\WinEdt.exe [AddMenus('%WINEDT%\polytexMenu.dat');Menu('E&xit')]
@echo Installation terminee
:exit
@pause
