@if exist .aux\%1-poly-concepts.idx goto aux
@if exist %1-poly-concepts.idx goto noaux
@if exist .aux\concepts.idx goto oldaux
@if exist concepts.idx goto old
@echo No %1 index files found
@goto fin
:old
makeindex -s concepts.ist concepts
makeindex -s notions.ist notions
makeindex -s noms
@goto fin
:oldaux
makeindex -s concepts.ist .aux\concepts
makeindex -s notions.ist .aux\notions
makeindex -s .aux\noms 
@goto fin
:noaux
makeindex -s concepts.ist %1-poly-concepts
makeindex -s notions.ist  %1-poly-notions
makeindex -s %1-poly-noms
@goto fin
:aux
makeindex -s concepts.ist .aux\%1-poly-concepts
makeindex -s notions.ist .aux\%1-poly-notions
makeindex -s .aux\%1-poly-noms
@goto fin
:fin
