%%
%% hustthesis-en.cls 2013/06/01
%%
%% This is the unofficial LaTeX class for Thesis Template of
%% Huazhong University of Science and Technology (English Version).
%%
%% If you need the Chinese Version Template, view the url below:
%% https://github.com/michael911009/HUSTThesis
%%
%% 
%% Contributors:
%%   Xu Cheng <xucheng@me.com>
%%
%% Copyright (C) 2013 by Xu Cheng <xucheng@me.com>
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%  http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 
%% This work has the LPPL maintenance status `maintained'.
%%  
%% The Current Maintainer of this work is Xu Cheng.
%% 
%% This work consists of the files hustthesis-en.cls, hust-thesis-var-en.tex
%% and along with its documnet and example files.
%%
%%********************************************************************
%
%  Options:
%
%  degree = [none, fyp, bachelor, master, phd]
%    Set degree:
%         none     (default)
%         fyp      (final year project)
%         bachelor
%         master
%         phd
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hustthesis-en}[2013/06/01 Huazhong University of Science and Technology Thesis Template (English Version)]

\RequirePackage{xkeyval}
\RequirePackage{ifthen}

% Degree setting
\DeclareOptionX{degree}[none]{
  \ifthenelse{\equal{#1}{none} \OR \equal{#1}{fyp} \OR \equal{#1}{bachelor} \OR \equal{#1}{master} \OR \equal{#1}{phd}}{
    \gdef\HUST@degree{#1}
  }{
     \ClassError{hustthesis-en}
      {Option degree can only be 'none', 'fyp', 'bachelor', 'master' or 'phd'}
      {Try to remove option degree^^J}
  }
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptionsX
\LoadClass[12pt, a4paper, openany]{book}

% Check Engine. It should be XeTeX or LuaTeX
\RequirePackage{iftex}

\ifXeTeX\else
  \ifLuaTeX\else
    \begingroup
      \errorcontextlines=-1\relax
      \newlinechar=10\relax
      \errmessage{^^J
      *******************************************************^^J
      * XeTeX or LuaTeX is required to compile this document.^^J
      * Sorry!^^J
      *******************************************************^^J
      }%
    \endgroup
  \fi
\fi

% Font
\RequirePackage{fontspec}
\setmainfont[
  Ligatures={Common,TeX},
  Extension=.otf,
  UprightFont= *-regular,
  BoldFont=*-bold,
  ItalicFont=*-italic,
  BoldItalicFont=*-bolditalic]{texgyretermes}
\setsansfont[Ligatures={Common,TeX}]{Droid Sans}
\setmonofont{CMU Typewriter Text}
\defaultfontfeatures{Mapping=tex-text}

% For font size and line spread
\RequirePackage{interfaces-LaTeX}
\changefont{linespread=1.2}

% Page setting
\RequirePackage{geometry}
\geometry{
  a4paper,
  top=1.2in,
  bottom=1.2in,
  left=1in,
  right=1in,
  includefoot
}

\RequirePackage{indentfirst}
\setlength{\parindent}{2em}
\setlength{\parskip}{0pt plus 2pt minus 1pt} % Skip between paragraphs 

% hyperref setting
\RequirePackage[unicode]{hyperref}
\hypersetup{
  bookmarksnumbered=true,
  bookmarksopen=true,
  bookmarksopenlevel=1,
  breaklinks=true,
  colorlinks=true,
  allcolors=black,
  plainpages=false,
  pdfpagelabels=true,
  pdfstartview={XYZ null null 1},
  pdfinfo={Template.Info={hustthesis-en.cls 2013/06/01, Copyright (C) 2013 by Xu Cheng, https://github.com/michael911009/HUSTThesis-en}}
}
\pdfpagewidth=\paperwidth
\pdfpageheight=\paperheight

% Color
\RequirePackage{color}
\RequirePackage[table]{xcolor}

% Math
\RequirePackage{amsmath,amssymb,amsfonts}
\RequirePackage[amsmath,amsthm,thmmarks,hyperref,thref]{ntheorem}

\RequirePackage{fancynum}
\setfnumgsym{\,}

\RequirePackage[all]{xy}
\RequirePackage{overpic}
\RequirePackage[lined,boxed,linesnumbered,ruled,vlined]{algorithm2e}

% Pic
\RequirePackage{graphicx,caption,subcaption}

% Table
\RequirePackage{array}
\RequirePackage{multirow,tabularx,ltxtable}

% Code Highlight, for more functions try to use minted.
\RequirePackage{listings}

% Bib
\RequirePackage[numbers,square,comma,sort&compress]{natbib}

% Other format
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{tocvsec2}
\RequirePackage[inline]{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{afterpage}
\RequirePackage{datenumber}
\RequirePackage{etoolbox}
\RequirePackage{appendix}
\RequirePackage[titles]{tocloft}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Equation Format
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\allowdisplaybreaks[4]

\abovedisplayskip=10bp plus 2bp minus 2bp
\abovedisplayshortskip=10bp plus 2bp minus 2bp
\belowdisplayskip=\abovedisplayskip
\belowdisplayshortskip=\abovedisplayshortskip

\numberwithin{equation}{chapter}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Theorem Format
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\theoremnumbering{arabic}
\theoremseparator{:}
\theorempreskip{1.2ex plus 0ex minus 1ex}
\theorempostskip{1.2ex plus 0ex minus 1ex}
\theoremheaderfont{\normalfont\bfseries}
\theoremsymbol{}

\theoremstyle{definition}
\theorembodyfont{\normalfont}
\newtheorem{definition}{Definition}[chapter]

\theoremstyle{plain}
\theorembodyfont{\itshape}
\newtheorem{proposition}{Proposition}[chapter]
\newtheorem{lemma}{Lemma}[chapter]
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{axiom}{Axiom}[chapter]
\newtheorem{corollary}{Corollary}[chapter]
\newtheorem{exercise}{Exercise}[chapter]
\newtheorem{example}{Example}[chapter]

% proof env use amsthm
\def\proofname{\textbf{Proof}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Floating Format
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlength{\intextsep}{0.7\baselineskip plus 0.1\baselineskip minus 0.1\baselineskip}

\setlength{\textfloatsep}{0.8\baselineskip plus 0.1\baselineskip minus 0.2\baselineskip}

\renewcommand{\textfraction}{0.15} 
\renewcommand{\topfraction}{0.85} 
\renewcommand{\bottomfraction}{0.65} 
\renewcommand{\floatpagefraction}{0.60} 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Table Format
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% For inserting new tabular inside cell
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}}

% to prevent \cline breaking page in longtable environment, use in this way:
% ... table content \\* \nopagebreak \cline{i-j}
\def\@cline#1-#2\@nil{%
  \omit
  \@multicnt#1%
  \advance\@multispan\m@ne
  \ifnum\@multicnt=\@ne\@firstofone{&\omit}\fi
  \@multicnt#2%
  \advance\@multicnt-#1%
  \advance\@multispan\@ne
  \leaders\hrule\@height\arrayrulewidth\hfill
  \cr
  \noalign{\nobreak\vskip-\arrayrulewidth}}

% Whether use old tabular setting
\newif\ifHUST@useoldtabular
\HUST@useoldtabularfalse

\def\TurnOffTabFontSetting{\HUST@useoldtabulartrue}
\def\TurnOnTabFontSetting{\HUST@useoldtabularfalse}

% Renew tabular
\AtBeginEnvironment{tabular}{
  \ifHUST@useoldtabular\else
    \changefont{size=11pt,linespread=1.4}
  \fi
}

% Renew tabularx
\AtBeginEnvironment{tabularx}{
  \ifHUST@useoldtabular\else
    \changefont{size=11pt,linespread=1.4}
  \fi
}

% Renew longtable
\AtBeginEnvironment{longtable}{
  \ifHUST@useoldtabular\else
    \changefont{size=11pt,linespread=1.4}
  \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Caption Format
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareCaptionFont{HUST@dawu}{\changefont{size=11pt}}
\DeclareCaptionLabelFormat{HUST@caplabel}{#1~#2}
\captionsetup{
  font=HUST@dawu,            
  labelformat=HUST@caplabel, 
  format=hang,            
  labelsep=quad,       
  skip=12pt  
}

\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Listings Format
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\definecolor{HUST@lstgreen}{rgb}{0,0.6,0}
\definecolor{HUST@lstgray}{rgb}{0.5,0.5,0.5}
\definecolor{HUST@lstmauve}{rgb}{0.58,0,0.82}

\lstset{
  basicstyle=\footnotesize\ttfamily\changefont{linespread=1},
  keywordstyle=\color{blue}\bfseries,
  commentstyle=\color{HUST@lstgreen}\itshape,
  stringstyle=\color{HUST@lstmauve},
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  numbers=left,
  numberstyle=\tiny\color{HUST@lstgray},
  frame=lines,
  rulecolor=\color{black},
  breaklines=true
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Numbering Format
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setcounter{secnumdepth}{3}

\titleformat{\chapter}
  {
    \bfseries            
    \centering               
    \changefont{size=18pt} 
  }
  {Chapter~\thechapter}
  {1em}                      
  {}
\titlespacing*{\chapter}{0pt}{0pt}{20pt} 

\titleformat*{\section}{\bfseries\changefont{size=16pt}}
\titlespacing*{\section}{0pt}{18pt}{6pt}

\titleformat*{\subsection}{\bfseries\changefont{size=14pt}}
\titlespacing*{\subsection}{0pt}{12pt}{6pt}

\titleformat*{\subsubsection}{\bfseries\changefont{size=13pt}}
\titlespacing*{\subsubsection}{0pt}{12pt}{6pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Content Format
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setcounter{tocdepth}{1}

\contentsmargin{2.0em}

% Ref:http://tex.stackexchange.com/questions/89103/remove-vertical-space-between-two-chapters-in-table-of-contents-in-latex
\newskip\HUST@oldcftbeforechapskip
\HUST@oldcftbeforechapskip=\cftbeforechapskip
\let\HUST@oldl@chapter\l@chapter
\let\HUST@oldl@section\l@section
\def\l@chapter#1#2{\HUST@oldl@chapter{#1}{#2}\cftbeforechapskip=3pt}
\def\l@section#1#2{\HUST@oldl@section{#1}{#2}\cftbeforechapskip=\HUST@oldcftbeforechapskip}

\let\HUST@oldl@figure\l@figure
\let\HUST@oldl@table\l@table
\def\l@figure#1#2{\HUST@oldl@figure{\figurename~#1}{#2}}
\def\l@table#1#2{\HUST@oldl@table{\tablename~#1}{#2}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Head&Foot Format
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\let\ps@plain\ps@fancy
\pagestyle{fancy}
\fancyhf{} 
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

\def\HUST@fancyhfempty{
  \afterpage{\fancyhf{}}
}

\def\HUST@fancyhfstyle{
  \afterpage{
    \fancyhf{}
    \fancyfoot[C]{\thepage}
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% itemize,enumerate,description
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlist{noitemsep,partopsep=0pt,topsep=.8ex}
\setlist[1]{labelindent=\parindent}
\setlist[enumerate,1]{label=\arabic*.}
\setlist[enumerate,2]{label*=\arabic*}
\setlist[enumerate,3]{label=\emph{\alph*})}
\setlist[description]{font=\bfseries}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Variables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\HUST@listfigurename{List of Figures}
\def\listfigurename{\HUST@listfigurename}
\def\HUST@listtablename{List of Tables}
\def\listtablename{\HUST@listtablename}

% Title
\def\title#1{\gdef\HUST@title{#1}\hypersetup{pdftitle={#1}}}
\title{}

% Author
\def\author#1{\gdef\HUST@author{#1}\hypersetup{pdfauthor={#1}}}
\author{}

% Date(Y-M-D)
\def\date#1#2#3{
  \setdate{#1}{#2}{#3}
}
\setdatetoday
\def\HUST@dateformat{\datedate}

% School Name
\def\schoolname#1{\gdef\HUST@schoolname{#1}}
\schoolname{}

% Address
\def\address#1{\gdef\HUST@address{#1}}
\address{}

% Major
\def\major#1{\gdef\HUST@major{#1}}
\major{}

% Supervisor
\def\supervisor#1{\gdef\HUST@supervisor{#1}}
\supervisor{}

% Ass-supervisor (optional)
\def\asssupervisor#1{\gdef\HUST@asssupervisor{#1}}
\asssupervisor{}

% Abstract
\long\def\abstract#1{\long\gdef\HUST@abstract{#1}}
\abstract{}

% Keywords
\def\keywords#1{\gdef\HUST@keywords{#1}\hypersetup{pdfkeywords={#1}}}
\keywords{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input Var
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\input{hust-thesis-var-en.tex}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Specical Page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\frontmatter{
  \clearpage
  \@mainmatterfalse
  \pagenumbering{Roman}
  \HUST@fancyhfstyle
}
\def\mainmatter{
  \clearpage
  \@mainmattertrue
  \pagenumbering{arabic}
  \HUST@fancyhfstyle
}
\def\backmatter{
  \clearpage
  \@mainmatterfalse
  \HUST@fancyhfstyle
  \settocdepth{chapter}
  \hypersetup{bookmarksopenlevel=0}
}

% Titlepage
\def\HUST@titlepage{
  \begin{center}
    \parbox[t][4.5cm][t]{.9\textwidth}{
      \begin{center}
        \changefont{size=16pt,linespread=1.1}
        \HUST@applyname
      \end{center}
    }
    \parbox[t][5.7cm][t]{\textwidth}{
      \begin{center}
        \changefont{size=18pt,linespread=1.3}
        \textbf{\textsf{\HUST@title}}
      \end{center}
    }
    \parbox[t][5cm][t]{.8\textwidth}{
      \begin{center}
      \setlength{\extrarowheight}{5pt}
      \changefont{size=16pt,linespread=1.5}
      \TurnOffTabFontSetting
      \begin{tabular}{l@{~:~}p{18em}}
        \HUST@authortitle     & {\HUST@author} \\
        \HUST@majortitle      & {\HUST@major} \\
        \HUST@supervisortitle & {\HUST@supervisor}
        \ifthenelse{\equal{\HUST@asssupervisor}{}}{}{
          \\ \HUST@asssupervisortitle & {\HUST@asssupervisor}
        }
      \end{tabular}
      \TurnOnTabFontSetting
      \end{center}
    }
    \parbox[t][7cm][b]{.8\textwidth}{
      \begin{center}
      \bfseries
      \changefont{size=14pt,linespread=2.0}
      \HUST@schoolname \\
      \HUST@address \\
      \HUST@dateformat
    \end{center}
    }
  \end{center}
}

\def\maketitle{
  \HUST@fancyhfempty
  \let\HUST@oldthepage\thepage
  \def\thepage{Titlepage}
  \begin{titlepage}
    \HUST@titlepage
  \end{titlepage}
  \let\thepage\HUST@oldthepage
  \setcounter{page}{1}
  \HUST@fancyhfstyle
}
\def\makecover{\maketitle}


% Abstract Page
\def\HUST@abstractpage{
  \chapter*{\textsf{\HUST@abstractname}}
  \HUST@abstract \hfill
  \\[1.2ex]
  \noindent\textbf{\HUST@keywordstitle}\hspace{.8em} \HUST@keywords
}

\def\makeabstract{
  \phantomsection
  \addcontentsline{toc}{chapter}{\HUST@abstractname}
  \HUST@abstractpage
  \clearpage
}

\let\HUST@tableofcontents\tableofcontents
\def\tableofcontents{
  \pdfbookmark{\contentsname}{\contentsname}
  \HUST@tableofcontents
  \clearpage
}

% Acknowledge Page
\newenvironment{ack}{
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{\HUST@ackname}
  \chapter*{\HUST@ackname}
  \begingroup
  \normalsize
}{
  \endgroup
}

% Publications Page
\newenvironment{publications}{
  \clearpage
  \ifHUST@inappendix
    \chapter{\HUST@publicationtitle}
  \else
    \phantomsection
    \addcontentsline{toc}{chapter}{\HUST@publicationtitle}
    \chapter*{\HUST@publicationtitle}
  \fi
  \begin{enumerate}[labelindent=0pt,label={[\arabic*]}]
}{
  \end{enumerate}
}

% Bib Page
\bibliographystyle{IEEEtran}
\let\HUST@bibliography\bibliography
\def\bibliography#1{
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{\bibname}
  \HUST@bibliography{IEEEabrv,#1}
}

% Appendix
\newif\ifHUST@inappendix
\HUST@inappendixfalse
\newif\ifHUST@appendix@resetmainmatter
\HUST@appendix@resetmainmatterfalse
\renewenvironment{appendix}{
  \if@mainmatter
    \HUST@appendix@resetmainmatterfalse
  \else
    \HUST@appendix@resetmainmattertrue
    \@mainmattertrue
  \fi
  \appendixtitletocon
  \appendices
  \titleformat{\chapter}
  {
    \bfseries           
    \centering               
    \changefont{size=18pt}   
  }
  {\appendixname\,\thechapter} 
  {1em}              
  {}
  \HUST@inappendixtrue
}{
  \endappendices
  \HUST@inappendixfalse
  \ifHUST@appendix@resetmainmatter
    \HUST@appendix@resetmainmatterfalse
    \@mainmatterfalse
  \else\fi
}

% Figure List
\let\HUST@listoffigures\listoffigures
\def\listoffigures{
  \clearpage
  \ifHUST@inappendix
    \addtocounter{chapter}{1}
    \def\listfigurename{\appendixname\,\thechapter\hspace{1em}\HUST@listfigurename}
  \else
    \def\listfigurename{\HUST@listfigurename}
  \fi
  \phantomsection
  \ifHUST@inappendix
    \addcontentsline{toc}{chapter}{\thechapter\hspace{1em}\HUST@listfigurename}
  \else
    \addcontentsline{toc}{chapter}{\listfigurename}
  \fi
  \HUST@listoffigures
  \def\listfigurename{\HUST@listfigurename}
}

% Table List
\let\HUST@listoftables\listoftables
\def\listoftables{
  \clearpage
  \ifHUST@inappendix
    \addtocounter{chapter}{1}
    \def\listtablename{\appendixname\,\thechapter\hspace{1em}\HUST@listtablename}
  \else
    \def\listtablename{\HUST@listtablename}
  \fi
  \phantomsection
  \ifHUST@inappendix
    \addcontentsline{toc}{chapter}{\thechapter\hspace{1em}\HUST@listtablename}
  \else
    \addcontentsline{toc}{chapter}{\listtablename}
  \fi
  \HUST@listoftables
  \def\listtablename{\HUST@listtablename}
}
