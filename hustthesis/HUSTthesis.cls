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
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{HUSTthesis}[2013/03/01 Huazhong University of Science and Technology Thesis Template]

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
      *******************************************************}%
    \endgroup
  \fi
\fi

% Font

\ifXeTeX

\else\fi

\ifLuaTeX

\else\fi
