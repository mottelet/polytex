@echo off
if exist .aux\%1-poly.aux goto aux
if not exist %1-poly.aux goto fin
dir %1-poly*
del %1-poly*
:aux
dir .aux\%1-poly*
del .aux\%1-poly*
:fin
echo Suppression terminée
