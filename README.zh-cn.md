hustthesis
==========

>   To see English version, [click me](https://github.com/xu-cheng/hustthesis/blob/master/README.md).

[华中科技大学](http://www.hust.edu.cn)学术论文 **非官方** LaTeX模板。此模板为个人开发，如果因为使用这份模板蒙受了任何经济、学术上的损失，作者将不承担任何责任。

本项目属于[hust-latex-template](https://github.com/xu-cheng/hust-latex-template)的一部分。

如果您觉得本模板对您有所帮助，您可以请我喝杯咖啡让我保持清醒。谢谢！:)

[![Buy me a cup of coffee via PayPal](https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif)](https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=xucheng@me.com&lc=US&item_name=Donate%20this%20project&item_number=hustthesis&no_note=0&currency_code=USD&bn=PP%2dDonationsBF%3abtn_donate_LG%2egif%3aNonHostedGuest)

## 必备条件:

* 安装最新版本的 [TeXLive](http://www.tug.org/texlive/)（推荐）或 [MiKTeX](http://miktex.org/)。请确保所有宏包都更新至最新。
* 安装如下中文字体：
    * `AdobeSongStd-Light`
    * `AdobeKaitiStd-Regular`
    * `AdobeHeitiStd-Regular`
    * `AdobeFangsongStd-Regular`

## 安装

### 安装到本地

使用如下命令即可安装本模板到本地：
```
make install
```
如需卸载，则使用如下命令：
```
make uninstall
```

对于没有安装`Make`的Windows系统用户，可以使用如下命令安装：
```
makewin32.bat install
```
如需卸载，则使用如下命令：
```
makewin32.bat uninstall
```
虽然`makewin32.bat`表现与`Makefile`极其相似，但是还是强烈建议你安装`Make`，对于Windows用户可以在[这里](http://gnuwin32.sourceforge.net/packages/make.htm)下载。

### 免安装使用

如果你希望临时使用本模板，而非安装到本地供长期使用。使用如下命令解压模板文件：
```
make unpack
```
对于没有安装`Make`的Windows系统用户，可以使用如下命令解压：
```
makewin32.bat unpack
```
再将`hustthesis`目录下的如下文件拷贝到你TeX工程根目录下即可：
* `hustthesis.bst`
* `hustthesis.cls`
* `hust-title.eps`
* `hust-title.pdf`

## 使用

**重要 : 该模板只能使用 XeLaTeX 或 LuaLaTeX [推荐]编译。**

* 说明文档: 见 [hustthesis.pdf](https://github.com/xu-cheng/hustthesis/raw/master/hustthesis/hustthesis.pdf).
* 示例文档: 见 [hustthesis-zh-example.pdf](https://github.com/xu-cheng/hustthesis/raw/master/hustthesis/hustthesis-zh-example.pdf) 和 [hustthesis-en-example.pdf](https://github.com/xu-cheng/hustthesis/raw/master/hustthesis/hustthesis-en-example.pdf).

## 开源协议

本项目使用LPPL v1.3协议，请任意使用。
```
Copyright (C) 2013-2014 by Xu Cheng <xucheng@me.com>

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
along with its document and example files.
```