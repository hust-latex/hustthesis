%%
%% HUSTFYPthesis.cls 2013/03/01
%%
%% This is the unofficial LaTeX class for Final Year Project Thesis 
%% Template of Huazhong University of Science and Technology 
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
\ProvidesClass{HUSTFYPthesis}
[2013/03/01 Huazhong University of Science and Technology Final Year Project Thesis Template]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{HUSTthesis}}
\ProcessOptions
\LoadClass{HUSTthesis}

