HUSTThesis
==========

>   中文版[点击这里](https://github.com/michael911009/HUSTThesis/blob/master/README.zh-cn.md)。

An **Unofficial** LaTeX Template for Huazhong University of Science and Technology Thesis. If you write your thesis in English, checkout the [English Version Template](https://github.com/michael911009/HUSTThesis-en). This Template is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

## Motivation

When I use LaTeX to write my final year project thesis, I found the original [`HUSTPHDthesis.cls` (2006/04/06 V2.0)](http://sourceforge.net/projects/hustthesis) is very old. And it's too old that its development has been stopped. Since it uses package `CJK` to handle Chinese character, it's very buggy. I rewrite it to make several improvement:

1. Use `xeCJK`(for `XeLaTeX`) or `luatex-ja`(for `LuaLaTeX`)[Recommend] to better handle Chinese character. Since it use UTF-8 as only means of encoding, it has more comparability with other package.
2. Replace overdue package to new one.
3. Simplify the code.

## Installation

### Install into local

Use the command below to install this template into local.
```
make install
```
If you need uninstall it, use the command below.
```
make uninstall
```

For Windows User who don't install `Make`, use the command below to install.
```
makewin32.bat install
```
If you need uninstall it, use the command below.
```
makewin32.bat uninstall
```
Although `makewin32.bat` behaves much like `Makefile`, I still recommend you install `Make` into your Windows. You can download it from [here](http://gnuwin32.sourceforge.net/packages/make.htm).

### Use without installation

If you want to use this template temporary rather than installing it into local for long term use. Copy the files listed below from directory `hustthesis` into your TeX project root directory:
* `hustthesis.bst`
* `hustthesis.cls`
* `hust-thesis-var.tex`
* `hust-title.eps`
* `hust-title.pdf`


## Usage

**Important : This template can only be compiled by XeTeX or LuaTeX[Recommend].**

* Requirement:
  1. Install the latest version of [Texlive](http://www.tug.org/texlive/)(Recommend) or [MiKTex](http://miktex.org/). Please ensure that all the packages are up-to-date.
  2. Install following Chinese fonts:
      * `AdobeSongStd-Light`
      * `AdobeKaitiStd-Regular`
      * `AdobeHeitiStd-Regular`
      * `AdobeFangsongStd-Regular`
* Manual: See [hustthesis-doc.pdf](https://github.com/michael911009/HUSTThesis/raw/master/doc/hustthesis-doc.pdf).
* Example: See [hustthesis-example.pdf](https://github.com/michael911009/HUSTThesis/raw/master/example/hustthesis-example.pdf).

## License

LPPL v1.3 is chosen to be the license of the project. Use as you desire.

```
Copyright (C) 2013 by Xu Cheng <xucheng@me.com>

This work may be distributed and/or modified under the
conditions of the LaTeX Project Public License, either version 1.3
of this license or (at your option) any later version.
The latest version of this license is in
  http://www.latex-project.org/lppl.txt
and version 1.3 or later is part of all distributions of LaTeX
version 2005/12/01 or later.

This work has the LPPL maintenance status `maintained'.
 
The Current Maintainer of this work is Xu Cheng.

This work consists of the files hustthesis.bst, hustthesis.cls, 
hust-thesis-var.tex, hust-title.eps, hust-title.pdf and 
along with its documnet and example files.
```

The original `HUSTPHDthesis.cls` (2006/04/06 V2.0) whom this project is based on is written by Feng Jiang (2005 V1.0) and Huikan Liu <hkliu@mail.edu.cn> (2006 V2.0). You can browser its web site [here](http://sourceforge.net/projects/hustthesis).  Its license is shown below:
```
Copyright (C) 2006-2007 by Huikan Liu <hkliu@mail.edu.cn>

This code is distributed under the Perl Artistic License 
( http://language.perl.com/misc/Artistic.html ) 
and may be freely used, distributed and modified.
Retain the contribution notices and credits.
```
