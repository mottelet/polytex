%---------------------------------------------------------------------------
% Identification part
%---------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{polytex}[2020/09/24]

\def\fileversion{2.58}

%% Jeu 24 sep 2020 12:27:45 CEST

% Bugfix dans polyTheorem.sty (merci a Vincent Martin !)

%% jeu jan 15 18:17:44 CET 2009
%%
%% Ajout de l'option de classe "corrige" pour générer, après une compilation
%% avec l'option "polycopie", les exercices de cours avec leurs solutions.
%%

%%% Commande de création d'un nouveau triplet \ifcmd \cmdTrue \cmdFalse.
%%% Les définitions sont maintenant globales.
%%%
%%% \poly@newif{cmd}{True} ou \poly@newif{cmd}{False} permet d'initialiser
%%% le booleen \cmd à la valeur correspondante.

\def\poly@newif#1#2{%
   \expandafter\newif\csname if#1\endcsname%
   \expandafter\def\csname #1True\endcsname{\global\csname#1true\endcsname}%
   \expandafter\def\csname #1False\endcsname{\global\csname#1false\endcsname}%
   \csname #1#2\endcsname%
}

\RequirePackage{ifpdf,ifthen,version,afterpage}
\RequirePackage{amsmath,amsfonts,amsbsy}

%\RequirePackage[cm]{aeguill}
\RequirePackage[english,frenchb]{babel}

\poly@newif{macintosh}{False}

\poly@newif{transparent}{False}
\poly@newif{polycopie}{False}
\poly@newif{corrige}{False}
\poly@newif{propre}{False}
\poly@newif{intermediaire}{True}
\poly@newif{solutions}{False}

\poly@newif{ThemeBootStrap}{True}

\DeclareOption{intermediaire}{%
   \intermediaireTrue%
}

\DeclareOption{final}{%
   \intermediaireFalse%
}

\DeclareOption{polycopie}{%
   \polycopieTrue%
   \corrigeFalse
   \transparentFalse%
}

\DeclareOption{poly}{%
   \polycopieTrue%
   \corrigeFalse
   \transparentFalse%
}

\DeclareOption{transparent}{%
   \polycopieFalse%
   \transparentTrue%
}

\DeclareOption{slides}{%
   \polycopieFalse%
   \corrigeFalse
   \transparentTrue%
}


\DeclareOption{corrige}{%
   \polycopieFalse%
   \transparentFalse%
   \corrigeTrue
}

\DeclareOption{propre}{%
   \propreTrue%
}

\DeclareOption{sale}{%
   \propreFalse%
}

\DeclareOption{solutions}{%
   \solutionsTrue%   
}

\DeclareOption*{%
   \PassOptionsToPackage{\CurrentOption}{polyTheme}
}


%---------------------------------------------------------------------------
% Execution of options
%---------------------------------------------------------------------------

\ExecuteOptions{praline,final,polycopie,sale,10pt}

\ProcessOptions


%---------------------------------------------------------------------------
% Choix de l'encodage des fonts : T1 au lieu de OT1 pour eviter de nombreux
% problemes lies au caracteres accentues.
%---------------------------------------------------------------------------
%---------------------------------------------------------------------------
% Choix de l'encodage des caracteres du fichier source 
% suivant la plate-forme.
%
% Pour Unix et DOS, l'encodage des
% caracteres accentues est pris en compte automatiquement par le codage T1.
% Cependant, pour le Macintosh, le codage etant different, on doit utiliser 
% en plus  \RequirePackage[mac]{inputenc}.
%---------------------------------------------------------------------------

\ifmacintosh
   \RequirePackage[T1]{fontenc}
   \RequirePackage[mac]{inputenc}
   \ifpropre
      \def\prefixe{:.aux:}
   \else
      \def\prefixe{:}
   \fi
   \def\separateur{:}
\else
   \RequirePackage[T1]{fontenc}
   \ifpropre
       \def\prefixe{.aux/}
   \else
       \def\prefixe{./}
   \fi
   \def\separateur{/}
\fi

\xdef\jobslides{\jobname -slides}
\xdef\jobpoly{\jobname -poly}

\let\oldjobname=\jobname

\iftransparent
   \xdef\jobname{\prefixe\oldjobname -slides}
   \typeout{jobname = \jobname}
\fi
\ifpolycopie
   \xdef\jobname{\prefixe\oldjobname -poly}
   \typeout{jobname = \jobname}
\fi
\ifcorrige
   \xdef\jobname{\prefixe\oldjobname -corr}
   \typeout{jobname = \jobname}
\fi

%---------------------------------------------------------------------------
% Chargement préliminaire du thème (BootStrap)
%---------------------------------------------------------------------------

\ThemeBootStrapTrue

% Classe de base

\edef\poly@base@class{book}

\RequirePackage{polyTheme}

\LoadClass{\poly@base@class}

%
\ifx\pdfoutput\undefined        % on teste si on est dans latex
   \PassOptionsToPackage{xdvi}{color}
   \PassOptionsToPackage{dvips}{graphicx}
   \def\poly@extension{dvi}%
\else
   \def\poly@extension{pdf}%
\fi

\RequirePackage{graphicx}
   
\ifpdf        % on teste si on est dans latex ou pdflatex
   \DeclareGraphicsExtensions{.pdf,.png,.jpg}
\else
   \DeclareGraphicsExtensions{.ps,.eps,.pstex}
\fi


\RequirePackage{color}
\RequirePackage[colorlinks,hyperindex]{hyperref}
\RequirePackage{epsfig}
\RequirePackage{multind}
\RequirePackage{calc}
\RequirePackage{algorithmic}
\RequirePackage{algorithm}
\RequirePackage{tabularx}
\RequirePackage[section]{placeins}

%% Chemin par défaut pour les figures

\ifmacintosh
   \graphicspath{{:figures:}}
\else
   \graphicspath{{figures/}}
\fi

%
% Choix du type de support, polycopié ou transparent
%

\iftransparent
   \RequirePackage{polySlides}
\fi
\ifpolycopie
   \RequirePackage{polyCop}
\fi
\ifcorrige
   \RequirePackage{polyCorr}
\fi

%---------------------------------------------------------------------------
% Chargement final du thème
%---------------------------------------------------------------------------

\ThemeBootStrapFalse

\input{\themeName.clo}

\RequirePackage{extsizes}
\endinput
