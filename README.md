# Qu'est-ce-que PolyTeX ?
 
PolyTeX est un environnement d'écriture de documents navigables (pour l'instant le format
de sortie est le PDF) basé sur une classe LaTeX et quelques fichiers de commande. Typiquement,
PolyTeX peut être utilisé pour concevoir des polycopiés (avec cours, exercices, documents, etc.)
interactifs (on peut ajouter des liens vers divers types de documents).

Les auteurs sont, par ordre d'apparition dans le projet :

Bruno Bachimont (INA/UTC) [https://www.numdam.org/item/CG_1998___28-29_1_0](https://www.numdam.org/item/CG_1998___28-29_1_0/)

Nicolas Salzmann (UTC)

Antoine Grall (UTT)

Stéphane Mottelet (UTC) : (https://edutice.archives-ouvertes.fr/edutice-00000651)

PolyTeX est actuellement maintenu par le dernier auteur de la liste !

Pour voir quelques slides de présentation de PolyTeX, cliquer [ici](https://github.com/mottelet/polytex/blob/main/presentation-polytex/presentation.pdf)

Téléchargement de la dernière version : (https://github.com/mottelet/polytex/releases/)

# Comment fonctionne PolyTeX ?
 
Pas de mystère ! Un document PolyTeX est issu d'un fichier source utilisant une classe
LaTeX particulière : polytex.cls.

Les fonctionnalités "hypertextuelles" de PolyTeX sont basées sur le package hyperref, et la
génération de fichier PDF utilise pdflatex. Un document PolyTeX peut intégrer des
liens vers tous types d'objets (Video, Son, etc.).  Cependant, la gestion de certains types
d'annotation peut différer suivant les plate-formes. Les fichiers obtenus en fin de chaine
sont au format PDF et peuvent être visionnés grace à Acrobat Reader.

# Exemples
 
Voici un exemple de document PolyTeX : [cours.pdf](http://www.utc.fr/~mottelet/polytex/cours.pdf)

Voici un autre exemple intégrant du son et de la video (l'archive est à décompresser au préalable) : archive.zip

# Documentation
 
Manuel de PolyTeX (1.5 mis à pour la version 2.2).

Version ecran : [Manuel-ecran.pdf](https://github.com/mottelet/polytex/blob/main/PolyTeX/doc/Manuel-ecran.pdf)

Version papier : [Manuel.pdf](https://github.com/mottelet/polytex/blob/main/PolyTeX/doc/Manuel.pdf)

Ce manuel est assez ancien et ne fait pas état de nouvelles possibilité de PolyTeX.

Un tutoriel écrit par Johan Millaud : [Installation et prise en main de PolyTeX](http://www.iutenligne.net/ressources/installation-et-prise-en-main-de-polytex.html)

# Plate-forme supportées

PolyTeX peut fonctionner a priori sur n'importe quelle plate-forme, pourvu qu'une
distribution LaTeX standard soit installée :

Unix/Linux/MacOSX : il suffit d'une distribution teTeX. C'est le cas des distributions installées dans les packages LaTeX des Linux classiques (Ubuntu,Debian, Fedora) et de la distribution MacTeX+TeXShop sur MacOSX (https://tug.org/mactex/mactex-download.html)

Windows : il suffit d'une distribution MikTeX ou autre

# Editeur   
On peut a priori utiliser l'éditeur de son choix, mais pour chaque plate-forme un
effort a été fait pour que PolyTeX puisse être utilisé à partir d'un éditeur :

Unix/Linux/MacOSX : Nedit (GPL)
Windows : WinEdt (shareware)
MacOSX : TeXShop (GPL) 

Projets en cours,  Appel à bonnes volontés :

Le projet PolyTeXML (environnement XML au dessus de PolyTeX) est toujours à un stade expérimental. Une bonne nouvelle est que l'éditeur XML epcedit est devenu gratuit (mais pas encore open source) (screenshot)

Ecriture de nouveaux "thèmes" : la structure actuelle de PolyTeX permet de développer assez rapidement de nouveaux "thèmes" graphiques. Les contributions extériereures sont fortement encouragées !

# Téléchargement
     
[Unix/Linux/MacOS/Windows](https://github.com/mottelet/polytex/releases)

Nouveautés de la 2.58 : bug fix dans l'environnement hypertheoreme

Nouveautés de la 2.57 : bug fix d'apparition d'un \nobreak avec TeXLive > 2018

Nouveautés de la 2.56 : macros TeXShop pour MacOSX

Nouveautés de la 2.55 : nouvelle option de style "corrige", qui permet d'obtenir un document contenant les exercices de cours avec leurs solutions ou aides. Voir les autres détails dans le fichier Readme.txt.


