HUSTThesis
==========

>   To see English version, [click me](https://github.com/michael911009/HUSTThesis/blob/master/README.md).

华科学术论文LaTeX模板。

## 起源

当我使用 LaTeX 撰写我的毕业设计论文的时候，我发现原有的模板[`HUSTPHDthesis.cls` (2006/04/06 V2.0)](http://sourceforge.net/projects/hustthesis)已经非常古老了，并停止了维护。因为它使用古老的`CJK`宏包处理中文字体，使用它会遇到各种bug。于是我重写了这个模板，并作了如下改进：

1. 使用 <del>`xeCJK`（`XeLaTeX`中）</del>[当前不建议使用]或 `luatex-ja`（`LuaLaTeX`中）宏包处理中文字体。因为他们都使用UTF-8编码，其能更好的与其他宏包兼容。
2. 将过时的旧宏包更换为新的宏包。
3. 简化代码。

## 安装

## 使用

**重要 : 该模板只能使用 <del>XeTeX</del>[当前不建议使用] 或 LuaTeX 编译。**

* 必备条件:
  1. 安装最新版本的 [Texlive](http://www.tug.org/texlive/)（推荐）或 [MiKTex](http://miktex.org/)。请确保所有宏包都更新至最新。
  2. 安装如下中文字体：
      * `AdobeSongStd-Light`
      * `AdobeKaitiStd-Regular`
      * `AdobeHeitiStd-Regular`
      * `AdobeFangsongStd-Regular`
* 说明文档: 见 [hustthesis-doc.pdf](https://github.com/michael911009/HUSTThesis/blob/master/doc/hustthesis-doc.pdf)。
* 示例文档: 见 [hustthesis-example.pdf](https://github.com/michael911009/HUSTThesis/blob/master/example/hustthesis-example.pdf)。

## 开源协议

本项目使用LGPL 2.1协议，请任意使用。

```
Copyright (C) 2013 by Xu Cheng <xucheng@me.com>, 
                      Chen Lei <imhijacker@gmail.com>

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.
 
You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, 
MA 02110-1301 USA
```

本项目所依据的原始的`HUSTPHDthesis.cls` (2006/04/06 V2.0)由 Feng Jiang (2005 V1.0) 和 Huikan Liu <hkliu@mail.edu.cn> (2006 V2.0)编写。 你可以在[这里](http://sourceforge.net/projects/hustthesis)浏览原始的模板的主页。原始模板依据如下协议：
```
Copyright (C) 2006-2007 by Huikan Liu <hkliu@mail.edu.cn>

This code is distributed under the Perl Artistic License 
( http://language.perl.com/misc/Artistic.html ) 
and may be freely used, distributed and modified.
Retain the contribution notices and credits.
```
