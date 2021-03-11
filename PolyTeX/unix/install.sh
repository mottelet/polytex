#!/bin/sh
#
# Shell-script d'installation de PolyTeX pour UNIX/teTeX
#
# S. Mottelet, le 27/01/2009

if test ! -z `which kpsewhich`
	then TEXM=`kpsewhich book.cls`
	TEXM=`dirname $TEXM`
	TEXM=`dirname $TEXM`
	TEXM=`dirname $TEXM`
	TEXM=`dirname $TEXM`
else
   	echo "Impossible de trouver les commandes de votre distribution teTeX"
      echo "Contactez votre administrateur syst?me"
      exit 1;
fi 

echo -e  "Repertoire d'installation de votre distribution teTeX  [$TEXM] : \c"
read TEXMF
if test -z "$TEXMF";
   then TEXMF=$TEXM
fi
if test ! -w $TEXMF;
      then echo "Vous n'avez pas l'autorisation d'écriture dans $TEXMF"
      echo "Contactez votre administrateur système"
      exit 1;
fi

echo -e  "Supression des anciens fichiers : \c"   
if test -d  $TEXMF/tex/latex/polytex;
   then rm -Rf $TEXMF/tex/latex/polytex
fi
if test -d  $TEXMF/tex/latex/polytexbeta;
   then rm -Rf $TEXMF/tex/latex/polytexbeta
fi
echo "OK"

echo -e  "Installation des fichiers de style PolyTeX `cat ../VERSION`: \c"
cp -Rf ../texmf/tex/latex/polytex $TEXMF/tex/latex
cp -f ../texmf/makeindex/*.ist $TEXMF/makeindex
mkdir -p $TEXMF/tex/latex/misc
cp -f ../texmf/tex/latex/misc/* $TEXMF/tex/latex/misc
echo  "OK"

KPSE=`which kpsewhich`
POLYBIN=`dirname $KPSE`

echo -e  "Repertoire d'installation des fichiers de commande [$POLYBIN] : \c"
read POLYB
if test -z "$POLYB";
   then POLYB=$POLYBIN
fi
echo -e  "Installation des commandes dans $POLYB : \c"
if test ! -w $POLYB;
      then echo "ECHEC" 
      echo "Vous n'avez pas l'autorisation d'écriture dans $POLYB"
      echo "Contactez votre administrateur système"
      exit 1;
else
   cp -f bin/* $POLYB
   echo  "OK"
fi
echo -e  "Mise à jour de la base de données des fichiers de teTeX : \c"
mktexlsr
