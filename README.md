HUSTThesis-en
==========

A English Version **Unofficial** LaTeX Template for Huazhong University of Science and Technology Thesis. If you write your thesis in Chinese, please use [Chinese Version Template](https://github.com/michael911009/HUSTThesis). This template is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

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

If you want to use this template temporary rather than installing it into local for long term use. Copy the files listed below from directory `hustthesis-en` into your TeX project root directory:
* `hustthesis-en.cls`
* `hust-thesis-var-en.tex`

## Usage

**Important : This template can only be compiled by XeTeX or LuaTeX[Recommend].**

Please install the latest version of [Texlive](http://www.tug.org/texlive/)(Recommend) or [MiKTex](http://miktex.org/). Please ensure that all the packages are up-to-date.

* Manual: See [hustthesis-en-doc.pdf](https://github.com/michael911009/HUSTThesis-en/raw/master/doc/hustthesis-en-doc.pdf).
* Example: See [hustthesis-en-example.pdf](https://github.com/michael911009/HUSTThesis-en/raw/master/example/hustthesis-en-example.pdf).

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

This work consists of the files hustthesis-en.cls, hust-thesis-var-en.tex
and along with its documnet and example files.
```
