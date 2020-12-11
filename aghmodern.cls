% Class file for
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{aghmodern}[2020/06/10 Modernized AGH thesis template]

\LoadClass{scrbook}
\RequirePackage{kvoptions,etoolbox,iftex}

%% Parse options
\DeclareBoolOption{minted}
\DeclareBoolOption{print}
\DeclareBoolOption{oneside}
\DeclareComplementaryOption{twoside}{oneside}
\DeclareStringOption[polish]{language}
\DeclareStringOption[master]{type}
\DeclareDefaultOption{\ClassWarning{aghmodern}{Unknown \CurrentOption}}
\ProcessKeyvalOptions*
%% END options

\ifaghmodern@oneside
\PassOptionsToClass{oneside}{scrbook}
\else
\PassOptionsToClass{twoside}{scrbook}
\fi

\RequirePackage{scrlayer-scrpage}
\KOMAoptions{fontsize=11pt,DIV=10,BCOR=2cm,automark,headsepline,footsepline,plainfootsepline,toc=listof,toc=bib}

%% Thesis language
\newtoggle{aghmodern@polish}
\newtoggle{aghmodern@english}
\ifdefstring{\aghmodern@language}{polish}{
	\toggletrue{aghmodern@polish}
}{
	\toggletrue{aghmodern@english}
}

%% Thesis type
\newtoggle{aghmodern@master}
\newtoggle{aghmodern@eng}
\ifdefstring{\aghmodern@type}{master}{
	\toggletrue{aghmodern@master}
}{
	\toggletrue{aghmodern@eng}
} 

\RequirePackage[svgnames]{xcolor}
\pagestyle{scrheadings}
\setkomafont{pagehead}{\sffamily\scshape\upshape}
\renewcommand*\chaptermarkformat{\thechapter\autodot\enskip}
\rohead{\headmark}
\cohead{}

\RequirePackage[spaces,obeyspaces]{url}
\RequirePackage{bookmark}
\RequirePackage{hyperref}

\ifaghmodern@print
\hypersetup{hidelinks,
pdfencoding=unicode}  
\else
\hypersetup{colorlinks,
citecolor=LimeGreen,
urlcolor=FireBrick,
linkcolor=Crimson,
pdfencoding=unicode} 
\fi
 
\RequirePackage{graphicx}
\RequirePackage{booktabs}

\ifLuaTeX
	\RequirePackage{fontspec}
	\newfontface\logofont{fagoco-mediumcaps.ttf}[Path=fonts/]
	\newcommand{\institutefont}{\Large\logofont}
	\setmonofont[Scale=MatchLowercase,AutoFakeSlant=0.1]{Fira Mono}
\else
	\newcommand{\institutefont}{\Large}
	\usepackage[utf8]{inputenc}

    \iftoggle{aghmodern@english}{
	\usepackage[T1]{fontenc}
    }{}

    \iftoggle{aghmodern@polish}{
		\usepackage[T1]{polski}
    }{}
\fi

\RequirePackage[mono=false]{libertinus}
\RequirePackage{microtype}
\RequirePackage{csquotes}

\def\titlePL#1{\gdef\@titlePL{#1}}
\def\titleEN#1{\gdef\@titleEN{#1}}
\def\faculty#1{\gdef\@faculty{#1}}
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\department#1{\gdef\@department{#1}}
\def\degreeprogramme#1{\gdef\@degreeprogramme{#1}}
\def\degreetype#1{\gdef\@degreetype{#1}}

\iftoggle{aghmodern@master}{
	\gdef\@thesistype{PRACA DYPLOMOWA MAGISTERSKA}
	\renewcommand*{\figureautorefname}{Rysunek}
	\renewcommand*{\tableautorefname}{Tablica}
}{}
\iftoggle{aghmodern@eng}{
	\gdef\@thesistype{PRACA INŻYNIERSKA}
}{} 

\iftoggle{aghmodern@english}{
	\usepackage[main=english,polish]{babel}
	\gdef\@titletop{\@titleEN}
	\gdef\@titlebottom{\foreignlanguage{polish}{\@titlePL}}
}{}

\iftoggle{aghmodern@polish}{
	\usepackage[main=polish,english]{babel}
	\gdef\@titletop{\@titlePL}
	\gdef\@titlebottom{\foreignlanguage{english}{\@titleEN}}
	\frenchspacing
}{} 

\title{\@titletop}

%% Info table
\newcommand{\@thesistable}{\sffamily
\begin{tabular}{p{40mm}l}
	Autor:				& {\bfseries \@author}          \\[-1mm]
	Kierunek studiów:	& {\bfseries \@degreeprogramme} \\[-1mm]
	Typ studiów:		& {\bfseries \@degreetype}		\\[-1mm]
	Opiekun pracy:		& {\bfseries \@supervisor}
\end{tabular}}

\newcommand{\@declaration}{\thispagestyle{empty}
{~~}\vspace{20mm}
\begingroup
\selectlanguage{polish}
\footnotesize
\begin{center}
\textbf{Oświadczenie studenta}
\end{center}

Uprzedzony(-a) o~odpowiedzialności karnej na podstawie art.~115 ust.~1 i~2 ustawy z~dnia 4~lutego 1994~r. o~prawie autorskim i~prawach pokrewnych (t.j. Dz.~U. z~2018 r. poz. 1191 z~późn. zm.):
„Kto przywłaszcza sobie autorstwo albo wprowadza w~błąd co do autorstwa całości lub części cudzego utworu albo artystycznego wykonania, podlega grzywnie, karze ograniczenia wolności albo pozbawienia wolności do lat 3.
Tej samej karze podlega, kto rozpowszechnia bez podania nazwiska lub pseudonimu twórcy cudzy utwór w~wersji oryginalnej albo w~postaci opracowania, artystyczne wykonanie albo publicznie zniekształca taki utwór, artystyczne wykonanie, fonogram, wideogram lub nadanie.”, a~także uprzedzony(-a) o~odpowiedzialności dyscyplinarnej na podstawie art.~307 ust.~1 ustawy z~dnia 20 lipca 2018 r. Prawo o~szkolnictwie wyższym i~nauce (Dz.~U. z~2018~r. poz.~1668 z~późn. zm.)
„Student podlega odpowiedzialności dyscyplinarnej za naruszenie przepisów obowiązujących w~uczelni oraz za czyn uchybiający godności studenta.”, oświadczam, że niniejszą pracę dyplomową wykonałem(-am) osobiście i~samodzielnie i~nie korzystałem(-am) ze źródeł innych niż wymienione w~pracy.

Jednocześnie Uczelnia informuje, że zgodnie z~art. 15a ww. ustawy o~prawie autorskim i~prawach pokrewnych Uczelni przysługuje pierwszeństwo w~opublikowaniu pracy dyplomowej studenta.
Jeżeli Uczelnia nie opublikowała pracy dyplomowej w~terminie 6~miesięcy od dnia jej obrony, autor może ją opublikować, chyba że praca jest częścią utworu zbiorowego.
Ponadto Uczelnia jako podmiot, o~którym mowa w~art.~7 ust.~1 pkt~1 ustawy z~dnia 20 lipca 2018~r. – Prawo o~szkolnictwie wyższym i~nauce (Dz.~U. z~2018 r. poz. 1668 z~późn. zm.), może korzystać bez wynagrodzenia i~bez konieczności uzyskania zgody autora z~utworu stworzonego przez studenta w~wyniku wykonywania obowiązków związanych z~odbywaniem studiów, udostępniać utwór ministrowi właściwemu do spraw szkolnictwa wyższego i~nauki oraz korzystać z~utworów znajdujących się w~prowadzonych przez niego bazach danych, w~celu sprawdzania z~wykorzystaniem systemu antyplagiatowego.
Minister właściwy do spraw szkolnictwa wyższego i~nauki może korzystać z~prac dyplomowych znajdujących się w~prowadzonych przez niego bazach danych w~zakresie niezbędnym do zapewnienia prawidłowego utrzymania i~rozwoju tych baz oraz współpracujących z nimi systemów informatycznych.
\vspace{1cm}
\begin{flushright}
.......................................................... \\
(czytelny podpis studenta)
\end{flushright}
\endgroup%
}

%% Title page
\renewcommand{\maketitle}{%
\begin{titlepage}
\begin{center}
% Logo, department
\includegraphics[width=\textwidth]{agh-name-color-pl.pdf}\\
\vspace*{3mm}
{%
	\institutefont{\@faculty}\\[3mm]
	\institutefont{\@department}%
}\\[1cm]
{\sffamily\Large \@thesistype}
\vspace*{9mm}

{\sffamily\Large\bfseries \@titletop} \\
\vspace*{4mm}
{\sffamily\small\bfseries \@titlebottom}
\end{center}

\vspace{4cm}
\noindent
\@thesistable
\vspace{2cm}

\begin{center}\small\sffamily\noindent{}Kraków, \@date\end{center}
\end{titlepage}
\cleardoubleoddemptypage
\@declaration
\cleardoubleoddemptypage
}
