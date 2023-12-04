\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{style}[]

%% Class and Options
\def\@@ptsize{10pt} % font size
\DeclareOption{9pt}{\def\@@ptsize{9pt}}
\DeclareOption{10pt}{\def\@@ptsize{10pt}}
\DeclareOption{11pt}{\def\@@ptsize{11pt}}
\DeclareOption{12pt}{\def\@@ptsize{12pt}}

\def\@twoside{0} % default as oneside
\DeclareOption{oneside}{\def\@twoside{0}} % one-side document
\DeclareOption{twoside}{\def\@twoside{1}} % two-side document
\ProcessOptions\relax
\LoadClass[a4paper,onecolumn,\@@ptsize]{article}

%% Page Settings
\RequirePackage[inner=2.0cm,outer=2.0cm,top=1.2cm,bottom=3.5cm]{geometry}
\newcommand{\firstfooteradditionalheight}{2em} % additional height for footer on the first page
\hfuzz=.5em % disable false positive of overfull \hbox

%% Document Propertities
\global\let\@semester\@empty
\global\let\@instructor\@empty
\global\let\@author\@empty
\global\let\@principal\@empty
\newcommand{\semester}[1]{\gdef\@semester{#1}} % Semester
\newcommand{\instructor}[1]{\gdef\@instructor{#1}} % Instructor
\newcommand{\principal}[1]{\gdef\@principal{#1}} % Principal Section

%% Fonts and Colors
\RequirePackage[T1]{fontenc}
\RequirePackage{bold-extra}
\RequirePackage[usenames,dvipsnames]{xcolor}
\definecolor{mypink1}{RGB}{70, 130, 180}
\definecolor{mypurple}{RGB}{100, 149, 237}

%% TikZ Rule
\RequirePackage{tikz}
\RequirePackage{array}
\RequirePackage{enumitem}
\RequirePackage{lmodern,tikz}
\usetikzlibrary{fadings, calc}
\newcommand{\tikzrule}[3][]{\tikz{\fill[#1] (0,0) rectangle (#2,#3);}}
\usetikzlibrary{tikzmark}
\newlist{questions}{enumerate}{3}
\setlist[questions]{label=\arabic*.}
\newcommand{\question}{\item}
\setlist[enumerate,1]{% (
leftmargin=*, itemsep=12pt, label={\textbf{\arabic*.)}}}
\newcommand*\circled[1]{\tikz[baseline=(char.base)]
{\node[shape=circle,draw,inner sep=2pt] (char) {#1};}}

%% Maths Settings
\RequirePackage{mathtools}
\RequirePackage{amssymb}
\usepackage{tasks}

%% Header and Footer
\RequirePackage{fancyhdr}
\RequirePackage[]{hyperref}
\setlength{\headheight}{52pt}
\setlength{\marginparwidth}{2cm}
\pagestyle{fancy}
\if\@twoside0
    \lhead{
        \fontfamily{cmss}\selectfont
        \textbf{Estructuras Discretas -- \@title}
    }
    \rhead{\thepage}
    \renewcommand\headrule{\vspace{-0.7em}\tikzrule[mypurple, path fading=east]{.4\textwidth}{0.2mm}}
\fi
\cfoot{}
% header and footer style for the first page
\fancypagestyle{firstpage}{
    \renewcommand\headrule{}
    \lhead{}
    \rhead{}
}

%% Title Settings
\RequirePackage{tabularx}
\RequirePackage{afterpage}
\newcommand{\pdftitleadditionalname}{}
\makeatletter         
\renewcommand\maketitle{
    \if\@author\@empty
        \let\@author\@instructor % instructor is the author (if not specified)
    \fi

    \thispagestyle{firstpage}
    \fontfamily{cmss}\selectfont % set font as Linux Libertine
    \enlargethispage{-\firstfooteradditionalheight} % make room for the footer
    \begin{minipage}{10.5cm}
        \centering
        {
            \fontsize{36}{48}\selectfont
            \textcolor{mypink1}{\bfseries\@principal}
        }\\[.5em]
        {
            \textbf{\@instructor} \qquad \textbf{\@author}
        }
    \end{minipage}
    \begin{minipage}{5cm}
        \vspace{0.7em}
        \centering
        {
            \large
            \fontfamily{cmss}\selectfont
            \textcolor{mypink1}{\bfseries\@semester}
            \linebreak
        }
        \LARGE\bfseries\@title{\fontfamily{cmss}\selectfont}
    \end{minipage}
    \\[.3em]
    \tikzrule[mypurple, path fading=east]{\textwidth}{.4em}

    \begin{center}
        \vspace{-2\baselineskip}
    \end{center}

}
\makeatother
