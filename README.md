HUSTThesis-en
==========

A English Version Unofficial LaTeX Template for Huazhong University of Science and Technology Thesis. If you write your thesis in Chinese, please use [Chinese Version Template](https://github.com/michael911009/HUSTThesis). This Template is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

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
