HUSTThesis
==========

>   中文版[点击这里](https://github.com/michael911009/HUSTThesis/blob/master/README.zh-cn.md)。

A LaTeX Template for HUST Thesis.

## Motivation

When I use LaTeX to write my final year project thesis, I found the original [`HUSTPHDthesis.cls` (2006/04/06 V2.0)](http://sourceforge.net/projects/hustthesis) is very old. And it's too old that its development has been stopped. Since it uses package `CJK` to handle Chinese character, it's very buggy. I rewrite it to make several improvement:

1. Use <del>`xeCJK`(for `XeLaTeX`)</del>[Currently Depressed] or `luatex-ja`(for `LuaLaTeX`) to better handle Chinese character. Since it use UTF-8 as only means of encoding, it has more comparability with other package.
2. Replace overdue package to new one.
3. Simplify the code.

## Installation

## Usage

**Important : This template can only be compiled by <del>XeTeX</del>[Currently Depressed] or LuaTeX.**

* Requirement:
  1. Install the latest version of [Texlive](http://www.tug.org/texlive/)(Recommend) or [MiKTex](http://miktex.org/). Please ensure that all the packages are up-to-date.
  2. Install following Chinese fonts:
      * `AdobeSongStd-Light`
      * `AdobeKaitiStd-Regular`
      * `AdobeHeitiStd-Regular`
      * `AdobeFangsongStd-Regular`
* Manual: See [hustthesis-doc.pdf](https://github.com/michael911009/HUSTThesis/blob/master/doc/hustthesis-doc.pdf).
* Example: See [hustthesis-example.pdf](https://github.com/michael911009/HUSTThesis/blob/master/example/hustthesis-example.pdf).

## License

LGPL 2.1 is chosen to be the license of the project. Use as you desire.

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

The original `HUSTPHDthesis.cls` (2006/04/06 V2.0) whom this project is based on is written by Feng Jiang (2005 V1.0) and Huikan Liu <hkliu@mail.edu.cn> (2006 V2.0). You can browser its web site [here](http://sourceforge.net/projects/hustthesis).  Its license is shown below:
```
Copyright (C) 2006-2007 by Huikan Liu <hkliu@mail.edu.cn>

This code is distributed under the Perl Artistic License 
( http://language.perl.com/misc/Artistic.html ) 
and may be freely used, distributed and modified.
Retain the contribution notices and credits.
```
