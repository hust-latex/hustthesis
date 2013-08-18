hustthesis
==========

>   中文版[点击这里](https://github.com/xu-cheng/hustthesis/blob/master/README.zh-cn.md)。

An Unofficial Thesis Template in LaTeX for [Huazhong University of Science and Technology](http://www.hust.edu.cn). This template is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

This project is part of [hust-latex-template](https://github.com/xu-cheng/hust-latex-template).

If this template is useful for you, you might want to buy me a cup of coffee to keep me fresh. Thanks! :)

[![Buy me a cup of coffee via PayPal](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=xucheng@me.com&lc=US&item_name=Donate%20this%20project&item_number=hustthesis&no_note=0&currency_code=USD&bn=PP%2dDonationsBF%3abtn_donate_LG%2egif%3aNonHostedGuest)

## Requirement

* Install the latest version of [TeXLive](http://www.tug.org/texlive/)(Recommend) or [MiKTeX](http://miktex.org/). Please ensure that all the packages are up-to-date.
* Install following Chinese fonts:
    * `AdobeSongStd-Light`
    * `AdobeKaitiStd-Regular`
    * `AdobeHeitiStd-Regular`
    * `AdobeFangsongStd-Regular`

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

If you want to use this template temporary rather than installing it into local for long term use. Run below command to unpack the package.
```
make unpack
```
For Windows User who don't install `Make`, use the command below to unpack the package.
```
makewin32.bat unpack
```
Then copy following files from directory `hustthesis` into your TeX project root directory:
* `hustthesis.bst`
* `hustthesis.cls`
* `hust-title.eps`
* `hust-title.pdf`

## Usage

**Important : This template can only be compiled by XeLaTeX or LuaLaTeX[Recommend].**

* Manual: See [hustthesis.pdf](https://github.com/xu-cheng/hustthesis/raw/master/hustthesis/hustthesis.pdf).
* Example: See [hustthesis-zh-example.pdf](https://github.com/xu-cheng/hustthesis/raw/master/hustthesis/hustthesis-zh-example.pdf) and [hustthesis-en-example.pdf](https://github.com/xu-cheng/hustthesis/raw/master/hustthesis/hustthesis-en-example.pdf).

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

This work consists of the files hustthesis.bst, hustthesis.dtx,
hustthesis.ins and the derived file hustthesis.cls 
along with its documnet and example files.
```