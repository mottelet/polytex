
PolyTeX peut etre modifie et/ou redistribue sous les termes
de la licence GNU GPL, dont une copie est donnee dans le
fichier LICENSE. La derniere version de PolyTeX est 
disponible sur le site officiel www.dma.utc.fr/polytex

Historique des versions : 

Distribution polytex2.58  pour teTex/unix ou MikTeX/windows
---------------------------------------------------------

(Jeu 24 sep 2020 12:25:01 CEST)

Bugfix dans polyTheorem.sty pour l'environnement hypertheoreme et autres (lien vers la demo casse)


Distribution polytex2.57  pour teTex/unix ou MikTeX/windows
---------------------------------------------------------

(Mar 25 ao� 2020 14:48:06 CEST)

Bugfix dans polyIndex.sty pour TeXLive > 2018

Distribution polytex2.56  pour teTex/unix ou MikTeX/windows
---------------------------------------------------------

(Mer 20 jan 2016 14:31:07 CET)

macros TeXShop pour MacOSX

Distribution polytex2.55  pour teTex/unix ou MikTeX/windows
---------------------------------------------------------

(jeu jan 15 18:17:44 CET 2009)

Ajout de l'option de classe "corrige" pour g�n�rer, apr�s une compilation
avec l'option "polycopie", les exercices de cours avec leurs solutions.
Installation un pleu plus automatis�e sous Unix/Linux/MacOS.


Distribution polytex2.54  pour teTex/unix ou MikTeX/windows
---------------------------------------------------------

(Fri Jul  6 11:16:09 CEST 2007)

Correction d'un bug apparaissant avec les versions r�cente
de tetex et consorts (MikTeX et autres), lors de l'utilisation
des commandes de fontes de amsfonts (mathbb et autres).

Mise a jour du script d'installation pour Unix, pour prendre
en compte des changements d'emplacements de fichiers permettant
de valider le r�pertoire d'installation.


Distribution  polytex2.53  pour teTex/unix ou MikTeX/windows
-----------------------------------------------------------

(Wed Dec  1 15:16:53 CET 2004)

Supression du test de compatibilit� de la distribution LaTeX
pour le cas unix. 

Corrections dans le fichier polyindex.bat pour la version
windows.

Correction d'un bug survenant lors de l'utilisation de
la biblio.



Distribution polytex2.52  pour teTex/unix ou MikTeX/windows
---------------------------------------------------------

Quelques modifs relatives � la compatibilit� avec
polyTeXML.

Nouveaut�s. 
**********

Les fl�ches de navigations en
bas du grain avaient une facheuse tendance � ne pas apparaotre
lorsque le grain se terminait par un float (table, figure ou
autre) : ce probl�me est enfin r�solu !

Les options ecran et impression n'existent plus, et la distinction
se fait maintenant dans les fichiers .clo du th�me. 

Les deux th�mes fournis en standard sont maintenant :

vanilia : �quivalent � l'ancienne paire "vanillia,impression" 
praline : �quivalent � l'ancienne paire "vanillia,ecran"

et le th�me par d�faut est "vanilia"

Incompatibilit�s.
****************

On utilise maintenant amsmath pour la gestion de la mise
en forme de th�or�mes, remarques et autres. En cons�quence,
il n'est plus possible de d�finir des racourcis pour les
commandes \begin{equation} et \end{equation} : par
exemple un \newcommand{\beq}{\begin{equation}} d�finit
une commande \beq qui va provoquer une erreur de compilation.


Wed Oct 29 11:31:08 EST 2003

Distributio polytex2.51  pour teTex/unix ou MikTeX/windows
---------------------------------------------------------

Quelques modifications pour assurer la compatibilit� avec
polyTeXML. Le dossier "poubelle" contenant les fichiers
auxilliaires a encore chang� de nom : il s'appelle maintenant
".aux" (impossible de cr�er un r�pertoire "aux" sous windows).

Mon Sep  1 09:48:01 CEST 2003

Distribution polytex2.51  pour teTex/unix ou MikTeX/windows
---------------------------------------------------------

Quelques modifications et am�liorations du th�me vanillia.


Fri Jul 19 18:26:43 CEST 2002

Distribution polytex2.5  pour teTex/unix ou MikTeX/windows
---------------------------------------------------------

Nouvelle release avec quelques corrections, ainsi que de 
nombreuses modifications necessaires pour le fonctionnement
de polyTeXML (le "wrapper" XML, pas encore diffus�, en phase 
de test � l'UTC).

Attention : le dossier "poly" necessaire a l'option "propre"
doit maintenant s'apeller "aux".

Mon Mar 11 14:21:21 CET 2002

Distribution polytex2.41 pour teTex/unix ou MikTeX/windows
---------------------------------------------------------

Nouveaut�s : ajout du package "aeguill" pour avoir des guillemets
francais corrects en Computer Modern codage T1.

Supression des packages lucidabr et fancyhdr de 
la distribution (packages non utilis�s).

St�phane Mottelet, le 25/4/2001
stephane.mottelet@utc.fr


Distribution polytex2.4 pour teTex/unix ou MikTeX/windows
---------------------------------------------------------

Correction d'un bug � l'installation sous unix lors du
test de l'installation TeTeX (pb avec la derniere version
de french.sty!).


Distribution polytex2.3 pour teTex/unix ou MikTeX/windows
---------------------------------------------------------

Quelques changements par rapport � la version 2.2. Ils
concernent surtout la documentation du th�me "vanillia".
Si vous n'avez pas eu en main la version 2.2, veuillez
consulter les instructions concernant cette version
ci-dessous. Il y eu de grands changements par rapport
aux versions pr�c�dentes.

S. Mottelet, Mon Dec  4 14:57:15 CET 2000   

Distribution polytex2.2 pour teTex/unix ou MikTeX/windows
----------------------------------------------------------

A LIRE EN PREMIER :
-------------------

Les versions 2.0 et 2.1 ont �t� diffus�es de fa�on
restreinte, a l'UTC et � la facult� des sciences
de Marrakech. La version correspondant � cette
distribution est la 2.2.         

Pour ceux qui travaillent actuellement avec la version
"beta", il faut remplacer "polytexbeta" par "polytex"
dans le \documentclass. La classe polytex 1.5 peut etre
utilisee en rempla�ant  "polytex" par  "polytexold"

-------------------


Ce fichier donne des informations g�n�rales sur l'installation
de PolyTeX. Les sp�cificit�s de chaque plate-forme sont d�crites
dans les r�pertoires sp�cifiques :

Pour la distribution unix voir le fichier README dans le
dossier unix. Pour la distribution windows voir le fichier
README.txt dans le dossier windows.

Cependant les deux archives

polytex2.2-install.zip
polytex2.2-install.tar.gz

contiennent exactement la meme chose. Le site officiel
PolyTeX est en pr�paration, soyez patients, ca ne devrait
plus tarder.


INFORMATIONS SUR LA VERSION 2.2
-------------------------------

Voici, dans le d�sordre, ce qui a change par rapport 
a la version 1.5 :

0 - IMPORTANT : avant de recompiler vos anciens documents, veuillez
utiliser la commande "polyclean" pour effacer les anciens fichiers
intermediaires (se trouvant soit au meme niveau que votre document,
soit dans le dossier "poly") : polyclean nomDuDocument (sans
l'extension .tex).

1 - Le "noyau" de PolyTeX a �t� r�crit � 99%. Il est 
maintenant plus facile de mettre en oeuvre de nouvelles
chartes graphiques, sous forme de "th�mes". Pour l'instant
il n'existe q'un seul th�me (utilis� par d�faut) : c'est le
th�me/option de classe "vanillia". De nombreuses caract�ris-
tiques du th�mes sont modifiables via la macro 
\vanilliaOptions (voir document.tex dans le dossier ./exemple2.x)
ainsi que la documentation du theme dans le dossier

texmf/tex/latex/polytex/themes/vanillia

Pour les nostalgiques, un th�me impl�mentant
l'ancienne charte graphique sera d�velopp� assez rapidement. Je
compte sur ceux qui ont de l'exp�rience en programmation
TeX/LateX pour d�velopper de nouveau th�mes. Le fichier

texmf/tex/latex/polytex/themes/vanillia/vanillia.clo

peut bien sur servir de base. Pour pouvoir utiliser un
nouveau th�me il suffit de cr�er un fichier avec l'extension
.clo, par exemple "chocolat.clo" contenant les macros du th�me,
puis d'ajouter l'option de classe "chocolat" dans les options
du \documentclass.


1.bis - La version Windows int�gre maintenant le support de
l'�diteur shareware WinEdt version 5 : un menu "PolyTeX" lui est ajout�
� l'installation. Comme pr�c�demment, la version Unix supporte
Nedit et la version MacOs l'�diteur Alpha Lite.

2 - L'option "transparent" document�e dans le "Manuel de PolyTeX"
est enfin op�rationnelle. Cependant la commande \coursconcept
n'est pour l'instant pas op�rationnelle. Un exemple de ce qui peut
etre fait est donne dans le document 

exemple2.x/presentation-polytex/presentation.tex

3 - La documentation (obsol�te) se trouve dans le dossier "doc".
Un exemple illustrant ce qu'il est possible de faire depuis la
version 1.5 se trouve dans le dossier "exemple1.5". Un exemple
de fichier utilisant les nouveaut�s de la version 2.x (sons,
vid�o, etc.) se trouve dans le dossier "exemple2.x".

4 - Le dossier "template"
est un dossier mod�le � partir duquel vous pouvez produire votre propre
document.

5 - Vos anciens documents peuvent etre compil�s avec l'ancienne version 1.5
en changeant "polytex" par "polytexold" dans le \documentclass au debut
du document. 

6 - L'utilisation de la bibliographie fonctionne comme d�crit dans
le "Manuel de PolyTeX". Une nouvelle commande pour "G�n�rer la biblio"
a �t� ajout�e : il s'agit de la commande "polybib". Elle est automatiquement
ajout�e dans les menus des �diteurs de chaque distribution (WinEdt, Nedit,
Alpha).

7 - Une commande permettant de "faire le m�nage" a �t� ajout�e : "polyclean".
Cette commande permet de supprimer les fichiers interm�diaires g�n�r�s lors de
la compilation.  Un rappel : l'option de style "propre" fait en sorte que ces
fichiers soient cr�es dans un dossier "poly" se trouvant au meme niveau que
le document principal. Par d�faut cette option n'est pas active.

8 - La police par d�faut est maintenant la police Computer Modern. Cette police
convient pour une compilation en mode "impression". Pour le mode "ecran" je
conseille Times ou NewCenturySchoolBook (ajouter \usepackage{times} ou 
\usepackage{newcent} avant le \begin{document}).

9 - Les fichiers d'index sont maintenant nominatifs. Il est donc possible
de faire cohabiter plusieurs documents PolyTeX dans le meme dossier (cependant
la commande "polyindex" prend en compte les anciens fichiers d'index dans
le cas o� la classe "polytexold" est utilis�e au lieu de "polytex").

