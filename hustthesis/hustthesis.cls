%%
%% hustthesis.cls 2013/03/01
%%
%% This is the unofficial LaTeX class for Thesis Template of
%% Huazhong University of Science and Technology 
%%
%% 
%% Contributors:
%%   Xu Cheng <xucheng@me.com>
%%   Chen Lei <imhijacker@gmail.com>
%%
%% Copyright (C) 2013 by Xu Cheng <xucheng@me.com>, 
%%                       Chen Lei <imhijacker@gmail.com>
%%
%% This library is free software; you can redistribute it and/or
%% modify it under the terms of the GNU Lesser General Public
%% License as published by the Free Software Foundation; either
%% version 2.1 of the License, or (at your option) any later version.
%% 
%% This library is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
%% Lesser General Public License for more details.
%% 
%% You should have received a copy of the GNU Lesser General Public
%% License along with this library; if not, write to the Free Software
%% Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, 
%% MA 02110-1301 USA
%%
%%********************************************************************
%% 
%% This template is based on the original HUSTPHDthesis.cls (2006/04/06
%% V2.0) written by Feng Jiang (2005 V1.0) and Huikan Liu 
%% <hkliu@mail.edu.cn> (2006 V2.0). I rewrite it to replace CJK package 
%% to xeCJK(for xelatex) or luatex-ja(for lualatex) for better handling 
%% Chinese character and making it more compatible with other package.
%%
%% Original template is distributed under the Perl Artistic License 
%% ( http://language.perl.com/misc/Artistic.html ) 
%% and may be freely used, distributed and modified.
%% Retain the contribution notices and credits.
%%
%%********************************************************************
%
%  选项：
%
%  format = [final, draft]
% 
%    提交草稿选择 draft 选项，提交最终版选 final 选项。
%    草稿正文页包括页眉（“华中科技大学xx学位论文”），页眉修饰线（双线）。
%    页脚（页码），页脚修饰线（单线）。
%    最终版正文页不包括页眉、页眉修饰线和页脚修饰线，仅包含页脚。
%    默认设置为 final。
%
%  degree = [none, fyp, bachelor, master, phd]
%    设置学位，各选项含义如下：
%         none     - 空
%         fyp      - 毕业设计
%         bachelor - 学士学位
%         master   - 硕士学位
%         phd      - 博士学位
%    默认设置为 none。
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hustthesis}[2013/03/01 Huazhong University of Science and Technology Thesis Template]

\RequirePackage{xkeyval}
\RequirePackage{ifthen}

% draft 包含全部的页眉页脚
% final 页眉为空，页脚仅有页码
% 默认为final
\newif\ifHUST@finalformat
\DeclareOptionX{format}[final]{
  \ifthenelse{\equal{#1}{final}}{
    \HUST@finalformattrue
  }{
    \ifthenelse{\equal{#1}{draft}}{
      \HUST@finalformatfalse
    }{
      \ClassError{hustthesis}
      {Option format can only be 'final' or 'draft'}
      {Try to remove option format^^J}
    }
  }
}

\DeclareOptionX{degree}[none]{
  \ifthenelse{\equal{#1}{none} \OR \equal{#1}{fyp} \OR \equal{#1}{bachelor} \OR \equal{#1}{master} \OR \equal{#1}{phd}}{
    \gdef\HUST@degree{#1}
  }{
     \ClassError{hustthesis}
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

\ifXeTeX  % XeTeX下使用fontspec + xeCJK处理字体 [Currently Depressed]
  % 英文字体
  \RequirePackage{fontspec}
  \RequirePackage{xunicode}
  \setmainfont[Ligatures={Common,TeX}]{Tex Gyre Termes}
  \setsansfont[Ligatures={Common,TeX}]{Droid Sans}
  \setmonofont[Ligatures={Common,TeX}]{CMU Typewriter Text}
  \defaultfontfeatures{Mapping=tex-text}
  % 中文字体
  \RequirePackage[boldfont,slantfont,CJKmath]{xeCJK}
  \setCJKmainfont[BoldFont={Adobe Heiti Std},ItalicFont={Adobe Kaiti Std}]{Adobe Song Std}
  \setCJKsansfont{Adobe Kaiti Std}
  \setCJKmonofont{Adobe Fangsong Std}
  \xeCJKsetup{PunctStyle=kaiming}

  \newCJKfontfamily\HEI{Adobe Heiti Std}
  \newCJKfontfamily\KAI{Adobe Kaiti Std}
  \newCJKfontfamily\FANGSONG{Adobe Fangsong Std}
  \newcommand{\hei}[1]{{\HEI #1}}
  \newcommand{\kai}[1]{{\KAI #1}}
  \newcommand{\fangsong}[1]{{\FANGSONG #1}}

  \newcommand\ziju[2]{{\renewcommand{\CJKglue}{\hskip #1} #2}}
\else\fi

\ifLuaTeX  % LuaTeX下使用luatex-ja处理字体
  \RequirePackage{luatexja-fontspec}
  % 英文字体
  \setmainfont[Ligatures={Common,TeX}]{Tex Gyre Termes}
  \setsansfont[Ligatures={Common,TeX}]{Droid Sans}
  \setmonofont[Ligatures={Common,TeX}]{CMU Typewriter Text}
  \defaultfontfeatures{Mapping=tex-text,Scale=MatchLowercase}
  % 中文字体
  \setmainjfont[BoldFont={AdobeHeitiStd-Regular},ItalicFont={AdobeKaitiStd-Regular}]{AdobeSongStd-Light}
  \setsansjfont{AdobeKaitiStd-Regular}
  \defaultjfontfeatures{JFM=kaiming}

  \newjfontfamily\HEI{AdobeHeitiStd-Regular}
  \newjfontfamily\KAI{AdobeKaitiStd-Regular}
  \newjfontfamily\FANGSONG{AdobeFangsongStd-Regular}
  \newcommand{\hei}[1]{{\jfontspec{AdobeHeitiStd-Regular} #1}}
  \newcommand{\kai}[1]{{\jfontspec{AdobeKaitiStd-Regular} #1}}
  \newcommand{\fangsong}[1]{{\jfontspec{AdobeFangsongStd-Regular} #1}}

  \newcommand\ziju[2]{\vbox{\ltjsetparameter{kanjiskip=#1} #2}} % \vbox 是因为luatex-ja的bug，bug修复后移除
\else\fi

\RequirePackage{zhnumber}
\def\CJKnumber#1{\zhnumber{#1}} % 兼容CJKnumb

% 用于设置字号,行间距
\RequirePackage{interfaces-LaTeX}
\changefont{linespread=1.2} % 1.2倍行距 

% 页面设置
\RequirePackage[top=1.2in,bottom=1.2in,left=1in,right=1in]{geometry}

% 段首缩进
\RequirePackage{indentfirst}
\setlength{\parindent}{2em}
\setlength{\parskip}{0pt plus 2pt minus 1pt} % 段落之间的竖直距离

% hyperref setting
\RequirePackage[unicode]{hyperref}
\hypersetup{
  bookmarksnumbered=true,
  bookmarksopen=true,
  bookmarksopenlevel=0,
  breaklinks=true,
  colorlinks=true,
  allcolors=black,
  plainpages=false,
  pdfpagelabels=true,
  pdfstartview={XYZ null null 1}
}
\pdfpagewidth=\paperwidth
\pdfpageheight=\paperheight

% 颜色宏包
\RequirePackage{color}
\RequirePackage[table]{xcolor}

% 数学宏包
\RequirePackage{amsmath,amssymb,amsfonts}                            % AMSLaTeX 宏包
\RequirePackage[amsmath,amsthm,thmmarks,hyperref,thref]{ntheorem}    % 定理环境宏包

\RequirePackage{fancynum}                                            % 大数断开
\setfnumgsym{\,}

\RequirePackage[all]{xy}                                             % 画图宏包
\RequirePackage{overpic}                                             % 图形层叠
\RequirePackage[lined,boxed,linesnumbered,ruled,vlined]{algorithm2e} % 算法环境

% 图形宏包
\RequirePackage{graphicx,caption,subcaption} % 加载图形宏包

% 表格宏包
\RequirePackage{array}
\RequirePackage{multirow,tabularx,ltxtable}

% 代码环境
% 如需更多扩展，可以使用minted宏包
\RequirePackage{listings}

% 文献引用
\RequirePackage[numbers,square,comma,sort&compress]{natbib}

% 格式定制
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{tocvsec2}
\RequirePackage[inline]{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{afterpage}
\RequirePackage{datenumber}
\RequirePackage{etoolbox}
\RequirePackage{appendix}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 定制公式样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 允许长公式断行、分页
\allowdisplaybreaks[4]

% 设置公式与上下文的间距
\abovedisplayskip=10bp plus 2bp minus 2bp
\abovedisplayshortskip=10bp plus 2bp minus 2bp
\belowdisplayskip=\abovedisplayskip
\belowdisplayshortskip=\abovedisplayshortskip

\numberwithin{equation}{chapter}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 定制定理环境
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\theoremnumbering{arabic}
\theoremseparator{：}
\theorempreskip{1.2ex plus 0ex minus 1ex}
\theorempostskip{1.2ex plus 0ex minus 1ex}
\theoremheaderfont{\normalfont\bfseries\HEI}
\theoremsymbol{}

\theoremstyle{definition}
\theorembodyfont{\normalfont}
\newtheorem{definition}{定义}[chapter]

\theoremstyle{plain}
\theorembodyfont{\itshape}
\newtheorem{proposition}{命题}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{exercise}{练习}[chapter]
\newtheorem{example}{例}[chapter]

% proof 使用 amsthm
%\def\qedsymbol{$$\blacksquare$$}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 设定浮动对象
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 对于 h 参数，浮动对象与前后正文间的距离
\setlength{\intextsep}{0.7\baselineskip plus 0.1\baselineskip minus 0.1\baselineskip}

% 顶部或底部的浮动对象与正文间的距离
\setlength{\textfloatsep}{0.8\baselineskip plus 0.1\baselineskip minus 0.2\baselineskip}

% 设定浮动对象的比例
% 下面这组命令使浮动对象的缺省值稍微宽松一点，从而防止幅度
% 对象占据过多的文本页面，也可以防止在很大空白的浮动页上放置
% 很小的图形。
\renewcommand{\textfraction}{0.15} 
\renewcommand{\topfraction}{0.85} 
\renewcommand{\bottomfraction}{0.65} 
\renewcommand{\floatpagefraction}{0.60} 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 定制表格样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 方便在表格中插入新表格
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}}

% 防止 \cline 在 longtable 环境中断开页面，使用方法
% ... 表格内容 \\* \nopagebreak \cline{i-j}
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

% 表格中的字体比正文小半号，为大五号，11pt，同时表格中的行距为 1.4 倍行距

% 是否使用原始的表格环境
\newif\ifHUST@useoldtabular
\HUST@useoldtabularfalse

\def\TurnOffTabFontSetting{\HUST@useoldtabulartrue}
\def\TurnOnTabFontSetting{\HUST@useoldtabularfalse}

% 重定义 tabular 环境
\AtBeginEnvironment{tabular}{
  \ifHUST@useoldtabular\else
    \changefont{size=11pt,linespread=1.4}
  \fi
}

% 重定义 tabularx 环境
\AtBeginEnvironment{tabularx}{
  \ifHUST@useoldtabular\else
    \changefont{size=11pt,linespread=1.4}
  \fi
}

% 重定义 longtable 环境
\AtBeginEnvironment{longtable}{
  \ifHUST@useoldtabular\else
    \changefont{size=11pt,linespread=1.4}
  \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 设定图表标题样式
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareCaptionFont{HUST@dawu}{\changefont{size=11pt}}
\DeclareCaptionLabelFormat{HUST@caplabel}{#1~#2}
\captionsetup{
  font=HUST@dawu,            % 图表标题字体比正文小半号，为大五号，11pt
  labelformat=HUST@caplabel, % 设置标题标签的样式
  format=hang,               % 悬挂缩进的方式
  labelsep=quad,             % 不要图表号后面的":"
  skip=12pt                  % 设置标题前后间距
}

\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}
\renewcommand{\thefigure}{\arabic{chapter}-\arabic{figure}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 代码环境格式设置
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
  rulecolor=\color{black}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 段落章节标题格式设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 编号层级
\setcounter{secnumdepth}{3}

% 章节格式 
\titleformat{\chapter}
  {
    \bfseries\HEI            % 黑体字
    \centering               % 居中
    \changefont{size=18pt}   % 字号
  }
  {\zhnumber{\thechapter}} 
  {1em}                      % 章序号与章名之间空一个汉字符
  {}
\titlespacing*{\chapter}{0pt}{24pt}{20pt} % 章节前空24磅，段后空20磅

% 一级标题格式
% 采用黑体 16pt
% 段前空18磅，段后空6磅。
\titleformat*{\section}{\HEI\changefont{size=16pt}}
\titlespacing*{\section}{0pt}{18pt}{6pt}

% 二级标题格式
% 采用黑体 14pt
% 段前空12磅，段后空6磅。
\titleformat*{\subsection}{\HEI\changefont{size=14pt}}
\titlespacing*{\subsection}{0pt}{12pt}{6pt}

% 三级标题格式
% 采用黑体 13pt
% 段前空12磅，段后空6磅。
\titleformat*{\subsubsection}{\HEI\changefont{size=13pt}}
\titlespacing*{\subsubsection}{0pt}{12pt}{6pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 目录格式设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 目录层级
\setcounter{tocdepth}{1}

%适当增加目录项的右边距
\contentsmargin{2.0em}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 页眉页脚设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\let\ps@plain\ps@fancy
\pagestyle{fancy}
\fancyhf{} % 清空页眉页脚
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% 设置空白页眉页脚
\def\HUST@fancyhfempty{
  \afterpage{\fancyhf{}}
}

% 页眉页脚设置
\def\HUST@fancyhfstyle{
  \afterpage{
    \fancyhf{}
    \ifHUST@finalformat
      \fancyfoot[C]{\thepage}
    \else
      \fancyhead[C]{
        \ziju{1em}{\kai{\changefont{size=14pt}\HUST@zhschoolname\HUST@zhapplyname}}
        \vskip -5pt
        \vbox{
          \hrule width \textwidth height 0.4pt
          \vskip 1.0pt
          \hrule width \textwidth height 0.4pt
        }
      }
      \fancyfoot[C]{
        \hrule width \textwidth height 0.4pt
        \thepage
      }
    \fi
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% itemize，enumerate，description环境设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlist{noitemsep,partopsep=0pt,topsep=.8ex}
\setlist[1]{labelindent=\parindent}
\setlist[enumerate,1]{label=\arabic*.}
\setlist[enumerate,2]{label*=\arabic*}
\setlist[enumerate,3]{label=\emph{\alph*})}
\setlist[description]{font=\HEI}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 中文设置
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\indexname{索引}
\def\figurename{图}
\def\tablename{表}
\def\HUST@listfigurename{插图索引}
\def\listfigurename{\HUST@listfigurename}
\def\HUST@listtablename{表格索引}
\def\listtablename{\HUST@listtablename}
\def\algorithmcfname{算法}
\def\listingscaption{代码}
\def\proofname{\hei{证明}}
\def\bibname{参考文献}
\def\contentsname{目\hspace{1em}录}
\def\contentsnamenospace{目录}
\def\appendixname{附录}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 变量设置命令
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 中英文标题
\def\zhtitle#1{\gdef\HUST@zhtitle{#1}\hypersetup{pdftitle=#1}}
\def\entitle#1{\gdef\HUST@entitle{#1}}
\def\title#1#2{\zhtitle{#1}\entitle{#2}}
\title{}{}

% 中英文作者名
\def\zhauthor#1{\gdef\HUST@zhauthor{#1}\hypersetup{pdfauthor=#1}}
\def\enauthor#1{\gdef\HUST@enauthor{#1}}
\def\author#1#2{\zhauthor{#1}\enauthor{#2}}
\author{}{}

% 日期（年-月-日）
\def\date#1#2#3{
  \setdate{#1}{#2}{#3}
}
\setdatetoday
\def\HUST@zhdateformat{~\the\year~年~\the\month~月~\the\day~日}
\def\HUST@endateformat{\datedate}

% 中英文学校名
\def\zhschoolname#1{\gdef\HUST@zhschoolname{#1}}
\def\enschoolname#1{\gdef\HUST@enschoolname{#1}}
\def\schoolname#1#2{\zhschoolname{#1}\enschoolname{#2}}

% 中英文学校地址
\def\zhaddress#1{\gdef\HUST@zhaddress{#1}}
\def\enaddress#1{\gdef\HUST@enaddress{#1}}
\def\address#1#2{\zhaddress{#1}\enaddress{#2}}
\address{}{}

% 中英文专业名
\def\zhmajor#1{\gdef\HUST@zhmajor{#1}}
\def\enmajor#1{\gdef\HUST@enmajor{#1}}
\def\major#1#2{\zhmajor{#1}\enmajor{#2}}
\major{}{}

% 中英文指导老师名(含职称)
\def\zhsupervisor#1{\gdef\HUST@zhsupervisor{#1}}
\def\ensupervisor#1{\gdef\HUST@ensupervisor{#1}}
\def\supervisor#1#2{\zhsupervisor{#1}\ensupervisor{#2}}
\supervisor{}{}

% 中英文副指导老师名(含职称) [可选]
\def\zhasssupervisor#1{\gdef\HUST@zhasssupervisor{#1}}
\def\enasssupervisor#1{\gdef\HUST@enasssupervisor{#1}}
\def\asssupervisor#1#2{\zhasssupervisor{#1}\enasssupervisor{#2}}
\asssupervisor{}{}

% 学校编号
\def\schoolcode#1{\gdef\HUST@schoolcode{#1}}
\schoolcode{}
% 学号
\def\stuno#1{\gdef\HUST@stuno{#1}}
\stuno{}
% 分类号
\def\classno#1{\gdef\HUST@classno{#1}}
\classno{}
% 密级
\def\secretlevel#1{\gdef\HUST@secretlevel{#1}}
\secretlevel{}

% 中英文摘要
\long\def\zhabstract#1{\long\gdef\HUST@zhabstract{#1}}
\long\def\enabstract#1{\long\gdef\HUST@enabstract{#1}}
\long\def\abstract#1#2{\zhabstract{#1}\enabstract{#2}}
\abstract{}{}

% 中英文关键词
\def\zhkeywords#1{\gdef\HUST@zhkeywords{#1}\hypersetup{pdfkeywords=#1}}
\def\enkeywords#1{\gdef\HUST@enkeywords{#1}}
\def\keywords#1#2{\zhkeywords{#1}\enkeywords{#2}}
\keywords{}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 导入变量
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\input{hust-thesis-var.tex}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 特殊页面
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
}

% 中文封面
\def\HUST@zhtitlepage{
  \begin{center}
  \vspace*{-1.0cm}
  \parbox[t][2.2cm][t]{\textwidth}{
    \begin{center}
      \setlength{\tabcolsep}{0pt}
      \setlength{\extrarowheight}{12pt}
      \TurnOffTabFontSetting
      \changefont{size=14pt,linespread=1.2}
      \begin{tabularx}{\textwidth}{p{4em}p{5em}Xp{2em}p{12em}}
        \HUST@classnotitle    & \makebox[5em][l]{\rule[-2.0pt]{5em}{1pt}\hspace{-5em}\hfill\texttt{\HUST@classno}\hfill} & &
        \HUST@stunotitle      & \makebox[12em][l]{\rule[-2.0pt]{12em}{1pt}\hspace{-12em}\hfill\texttt{\HUST@stuno}\hfill} \\
        \HUST@schoolcodetitle & \makebox[5em][l]{\rule[-2.0pt]{5em}{1pt}\hspace{-5em}\hfill\texttt{\HUST@schoolcode}\hfill} & &
        \HUST@secrettile      & \makebox[12em][l]{\rule[-2.0pt]{12em}{1pt}\hspace{-12em}\hfill\texttt{\HUST@secretlevel}\hfill}
      \end{tabularx}
      \TurnOnTabFontSetting
    \end{center}
    }
  \parbox[t][6cm][t]{\textwidth}{
    \vspace{1.0cm}
    \begin{center}
    \includegraphics[scale=1.1]{hust-title.pdf}\\[0.8cm]
    \ziju{10bp}{\changefont{size=42pt}\HUST@zhapplyname}
    \end{center}
  }
  \parbox[t][4.8cm][t]{.8\textwidth}{
    \vspace{1.4cm}
    \begin{center}
    \changefont{size=22pt,linespread=1.6}\hei{\HUST@zhtitle}
    \end{center}
  }
  \parbox[t][7.4cm][t]{\textwidth}{
    \vspace{1.2cm}
    \begin{center}
    \changefont{size=18pt,linespread=1.5}
    \setlength{\extrarowheight}{0pt}
    \TurnOffTabFontSetting
    \begin{tabular}{p{5em}@{{：\hspace{1em}}}l}
    \HUST@zhauthortitle       & {\HUST@zhauthor} \\
    \HUST@zhmajortitle      & {\HUST@zhmajor} \\
    \HUST@zhsupervisortitle & {\HUST@zhsupervisor} \\
    \ifthenelse{\equal{\HUST@zhasssupervisor}{}}{}{
      \HUST@zhasssupervisortitle & {\HUST@zhasssupervisor} \\
    }
    \HUST@zhdatetitle & \HUST@zhdateformat
    \end{tabular}
    \TurnOnTabFontSetting
    \end{center}
  }
  \end{center}
}

% 英文封面
\def\HUST@entitlepage{
  \begin{center}
    \parbox[t][4.5cm][t]{.9\textwidth}{
      \begin{center}
        \changefont{size=16pt,linespread=1.1}
        \HUST@enapplyname
      \end{center}
    }
    \parbox[t][5.7cm][t]{\textwidth}{
      \begin{center}
        \changefont{size=18pt,linespread=1.3}
        \textbf{\textsf{\HUST@entitle}}
      \end{center}
    }
    \parbox[t][5cm][t]{.8\textwidth}{
      \begin{center}
      \setlength{\extrarowheight}{5pt}
      \changefont{size=16pt,linespread=1.5}
      \TurnOffTabFontSetting
      \begin{tabular}{l@{~:~}p{18em}}
        \HUST@enauthortitle     & {\HUST@enauthor} \\
        \HUST@enmajortitle      & {\HUST@enmajor} \\
        \HUST@ensupervisortitle & {\HUST@ensupervisor}
        \ifthenelse{\equal{\HUST@enasssupervisor}{}}{}{
          \\ \HUST@enasssupervisortitle & {\HUST@enasssupervisor}
        }
      \end{tabular}
      \TurnOnTabFontSetting
      \end{center}
    }
    \parbox[t][7cm][b]{.8\textwidth}{
      \begin{center}
      \bfseries
      \changefont{size=14pt,linespread=2.0}
      \HUST@enschoolname \\
      \HUST@enaddress \\
      \HUST@endateformat
    \end{center}
    }
  \end{center}
}

% 版权页面
\def\HUST@authorization{
  \centerline{\changefont{size=16pt} \HEI \HUST@originaldeclare}
  \vspace{1cm}
  {
    \changefont{size=12pt,linespread=2.0}
    \indent\HUST@originaldeclaretext
  }
  \\[1.9cm]
  \parbox[t]{\textwidth}{
    \changefont{size=12pt,linespread=1.5}
    \TurnOffTabFontSetting
    \hfill\begin{tabular}{ll}
        \HUST@zhauthorsig & \hspace{2em}\\
        \HUST@zhdatefield & \hspace{2em}\\
    \end{tabular}
    \TurnOnTabFontSetting
  }
  \\[1.9cm]
  \centerline{\changefont{size=16pt} \HEI \HUST@authtitle}
  \\[1cm]
  {
    \changefont{size=12pt,linespread=2.0}
    \indent\HUST@authorizationtext \\
    \indent\HUST@authorizationaddon \\
    \indent\HUST@authorizationcheck
  }
  \\[1.9cm]
  \hspace{2em}\parbox[t]{.9\textwidth}{
    \changefont{size=12pt,linespread=1.5}
    \TurnOffTabFontSetting
    \begin{tabular}{ll}
        \HUST@zhauthorsig & \hspace{2em}\\
        \HUST@zhdatefield & \hspace{2em}\\
    \end{tabular}
    \hfill
    \begin{tabular}{ll}
        \HUST@zhteachersig & \hspace{2em}\\
        \HUST@zhdatefield & \hspace{2em}\\
    \end{tabular}
    \TurnOnTabFontSetting
  }
  \vfill
}

% 生成封面命令
\def\maketitle{
  \HUST@fancyhfempty
  \let\HUST@oldthepage\thepage
  \def\thepage{封面}
  \begin{titlepage}
    \HUST@zhtitlepage
    \clearpage
    \HUST@entitlepage 
  \end{titlepage}
  \def\thepage{版权页}
  \HUST@authorization
  \clearpage
  \let\thepage\HUST@oldthepage
  \setcounter{page}{1}
  \HUST@fancyhfstyle
}
\def\makecover{\maketitle}

% 中文摘要
\def\HUST@zhabstractpage{
  \chapter*{\HUST@zhabstractname}
  \HUST@zhabstract
  \\[1.2ex]
  \noindent\hei{\HUST@zhkeywordstitle}\hspace{.8em} \HUST@zhkeywords
}

% 英文摘要
\def\HUST@enabstractpage{
  \chapter*{\textsf{\HUST@enabstractname}}
  \HUST@enabstract
  \\[1.2ex]
  \noindent\textbf{\HUST@enkeywordstitle}\hspace{.8em} \HUST@enkeywords
}

% 生成摘要命令
\def\makeabstract{
  \phantomsection
  \addcontentsline{toc}{chapter}{\HUST@zhabstractnamenospace}
  \HUST@zhabstractpage
  \clearpage
  \HUST@enabstractpage
  \clearpage
}

% 设置生成目录命令
\let\HUST@tableofcontents\tableofcontents
\def\tableofcontents{
  \pdfbookmark{\contentsnamenospace}{\contentsnamenospace}
  \HUST@tableofcontents
  \clearpage
}

% 设置致谢页面
\newenvironment{ack}{
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{\HUST@acknamenospace}
  \chapter*{\HUST@ackname}
  \begingroup
  \normalsize
}{
  \endgroup
}

% 设置攻读学位期间发表论文目录页面
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

% 设置参考文献页面
\bibliographystyle{hustthesis}
\let\HUST@bibliography\bibliography
\def\bibliography#1{
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{\bibname}
  \HUST@bibliography{#1}
}

% 设置附录环境
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
  \settocdepth{chapter}
  \hypersetup{bookmarksopenlevel=0}
  \titleformat{\chapter}
  {
    \bfseries\HEI            % 黑体字
    \centering               % 居中
    \changefont{size=18pt}   % 字号
  }
  {\appendixname\,\thechapter} 
  {1em}                      % 章序号与章名之间空一个汉字符
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

% 设置插图索引
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

% 设置表格索引
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
