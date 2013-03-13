%%
%% HUSTthesis.cls 2013/03/01
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
%  draftformat, finalformat
% 
%    提交草稿打开 draftformat 选项，提交最终版打开 finalformat 选项。
%    草稿正文页包括页眉（“华中科技大学学位论文”），页眉修饰线（双线）。
%    页脚（页码），页脚修饰线（单线）。
%    最终版正文页不包括页眉、页眉修饰线和页脚修饰线，仅包含页脚。
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{HUSTthesis}[2013/03/01 Huazhong University of Science and Technology Thesis Template]

% 默认为finalformat
\ExecuteOptions{finalformat}

% draftformat 包含全部的页眉页脚，最终版本的页眉为空，页脚仅有页码
\newif\ifHUST@finalformat
\DeclareOption{draftformat}{\HUST@finalformatfalse}
\DeclareOption{finalformat}{\HUST@finalformattrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass[12pt, a4paper, openany]{book}

\RequirePackage{ifthen}
\RequirePackage{iftex}

% Check Engine. It should be XeTeX or LuaTeX
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

\ifXeTeX  % XeTeX下使用fontspec + xeCJK处理字体
  % 英文字体
  \RequirePackage{fontspec}
  \RequirePackage{xunicode}
  \setmainfont[Ligatures={Common,TeX}]{Arial}
  \setsansfont{Arial}
  \setmonofont{CMU Typewriter Text}
  \defaultfontfeatures{Mapping=tex-text,Scale=MatchLowercase}
  % 中文字体
  \RequirePackage[boldfont,slantfont,CJKmath]{xeCJK}
  \setCJKmainfont[BoldFont={Adobe Heiti Std},ItalicFont={Adobe Kaiti Std}]{Adobe Song Std}
  \setCJKsansfont{Adobe Kaiti Std}
  \setCJKmonofont{Adobe Fangsong Std}
  \defaultCJKfontfeatures{Mapping=tex-text,PunctStyle=kaiming,Scale=MatchUppercase}

  \newfontinstance\HEI{Adobe Heiti Std}
  \newcommand{\hei}[1]{{\HEI #1}}
  \newfontinstance\KAI{Adobe Kaiti Std}
  \newcommand{\kai}[1]{{\KAI #1}}
  \newfontinstance\FANGSONG{Adobe Fangsong Std}
  \newcommand{\fangsong}[1]{{\FANGSONG #1}}
\else\fi

\ifLuaTeX  % LuaTeX下使用luatex-ja处理字体
  \RequirePackage{luatexja}
  \RequirePackage{luatexja-fontspec}
  % 英文字体
  \setmainfont[Ligatures={Common,TeX}]{Arial}
  \setsansfont{Arial}
  \setmonofont{CMU Typewriter Text}
  \defaultfontfeatures{Mapping=tex-text,Scale=MatchLowercase}
  % 中文字体
  \setmainjfont[BoldFont={AdobeHeitiStd-Regular},ItalicFont={AdobeKaitiStd-Regular}]{AdobeSongStd-Light}
  \setsansjfont{AdobeKaitiStd-Regular}
  \defaultjfontfeatures{Mapping=tex-text,JFM=kaiming,Scale=MatchUppercase}

  \newcommand{\hei}[1]{{\jfontspec{AdobeHeitiStd-Regular} #1}}
  \newcommand{\kai}[1]{{\jfontspec{AdobeKaitiStd-Regular} #1}}
  \newcommand{\fangsong}[1]{{\jfontspec{AdobeFangsongStd-Regular} #1}}
\else\fi

\RequirePackage{zhnumber}
\def\CJKnumber#1{\zhnumber{#1}} % 兼容CJKnumb

% Page setting
\RequirePackage[top=1.2in,bottom=1.2in,left=1.2in,right=1in,twoside=true]{geometry}

% 行间距
\RequirePackage{setspace}
\setstretch{1.5} % 1.5倍行距

% 段首缩进
\RequirePackage{indentfirst}
\setlength{\parindent}{2em}
\setlength{\parskip}{0pt plus 2pt minus 1pt} % 段落之间的竖直距离

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
  pdfstartview={XYZ null null 1}
}
\pdfpagewidth=\paperwidth
\pdfpageheight=\paperheight

% 颜色宏包
\RequirePackage{color}
\RequirePackage[table]{xcolor}

% 数学宏包
\RequirePackage{amsmath,amssymb,amsfonts}            % AMSLaTeX 宏包
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem} % 定理环境宏包

\RequirePackage{fancynum}                            % 大数断开
\setfnumgsym{\,}

\RequirePackage[all]{xy}                                             % 画图宏包
\RequirePackage{overpic}                                             % 图形层叠
\RequirePackage[lined,boxed,linesnumbered,ruled,vlined]{algorithm2e} % 算法环境

% 图形宏包
\RequirePackage{graphicx,caption,subcaption} % 加载图形宏包

% 表格宏包
\RequirePackage{array}
\RequirePackage{booktabs}  % 支持三线表表的宏包，方便水平表格线的粗细控制
\RequirePackage{multirow,tabularx,ltxtable}
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

% 文献引用
\RequirePackage[numbers,super,sort&compress]{natbib}
\RequirePackage{mcite}

% 格式定制
\RequirePackage{titlesec}
\RequirePackage{titletoc}

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

% 重定义 tabular 环境
\let\HUST@tabular\tabular
\let\endHUST@tabular\endtabular
\renewenvironment{tabular}{%
  \begingroup
  \changefont{size=11pt}
  \begin{spacing}{1.4}
  \HUST@tabular
}{%
  \endHUST@tabular
  \end{spacing}
  \endgroup
}

% 重定义 tabularx 环境
\let\HUST@tabularx\tabularx
\let\endHUST@tabularx\endtabularx
\renewenvironment{tabularx}{%
  \begingroup
  \changefont{size=11pt}
  \begin{spacing}{1.4}
  \HUST@tabularx
}{%
  \endHUST@tabularx
  \end{spacing}
  \endgroup
}

% 重定义 longtable 环境
\let\HUST@longtable\longtable
\let\endHUST@longtable\endlongtable
\renewenvironment{longtable}{%
  \begingroup
  \changefont{size=11pt}
  \begin{spacing}{1.4}
  \HUST@longtable
}{%
  \endHUST@longtable
  \end{spacing}
  \endgroup
}