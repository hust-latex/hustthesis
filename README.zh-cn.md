HUSTThesis
==========

**已过时: 这里是老版本的存档，新版本见[这里](https://github.com/michael911009/hustthesis/tree/master)。**

>   To see English version, [click me](https://github.com/michael911009/hustthesis/blob/hustthesis-oldversionarchive/README.md).

华中科技大学学术论文 **非官方** LaTeX模板。 如果你使用英文撰写论文，请使用[英文版本模板](https://github.com/michael911009/hustthesis/tree/hustthesis-en-oldversionarchive)。此模板为个人开发，如果因为使用这份模板蒙受了任何经济、学术上的损失，作者将不承担任何责任。

## 起源

当我使用 LaTeX 撰写我的毕业设计论文的时候，我发现原有的模板[`HUSTPHDthesis.cls` (2006/04/06 V2.0)](http://sourceforge.net/projects/hustthesis)已经非常古老了，并停止了维护。因为它使用古老的`CJK`宏包处理中文字体，使用它会遇到各种bug。于是我重写了这个模板，并作了如下改进：

1. 使用`xeCJK`（`XeLaTeX`中）或 `luatex-ja`（`LuaLaTeX`中）[推荐]宏包处理中文字体。因为他们都使用UTF-8编码，其能更好的与其他宏包兼容。
2. 将过时的旧宏包更换为新的宏包。
3. 简化代码。

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

如果你希望临时使用本模板，而非安装到本地供长期使用。将`hustthesis`目录下的如下文件拷贝到你TeX工程根目录下即可：
* `hustthesis.bst`
* `hustthesis.cls`
* `hust-thesis-var.tex`
* `hust-title.eps`
* `hust-title.pdf`

## 使用

**重要 : 该模板只能使用 XeTeX 或 LuaTeX [推荐]编译。**

* 必备条件:
  1. 安装最新版本的 [Texlive](http://www.tug.org/texlive/)（推荐）或 [MiKTex](http://miktex.org/)。请确保所有宏包都更新至最新。
  2. 安装如下中文字体：
      * `AdobeSongStd-Light`
      * `AdobeKaitiStd-Regular`
      * `AdobeHeitiStd-Regular`
      * `AdobeFangsongStd-Regular`
* 说明文档: 见 [hustthesis-doc.pdf](https://github.com/michael911009/hustthesis/raw/hustthesis-oldversionarchive/doc/hustthesis-doc.pdf)。
* 示例文档: 见 [hustthesis-example.pdf](https://github.com/michael911009/hustthesis/raw/hustthesis-oldversionarchive/example/hustthesis-example.pdf)。

## 开源协议

本项目使用LPPL v1.3协议，请任意使用。

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

本项目所依据的原始的`HUSTPHDthesis.cls` (2006/04/06 V2.0)由 Feng Jiang (2005 V1.0) 和 Huikan Liu <hkliu@mail.edu.cn> (2006 V2.0)编写。 你可以在[这里](http://sourceforge.net/projects/hustthesis)浏览原始的模板的主页。原始模板依据如下协议：
```
Copyright (C) 2006-2007 by Huikan Liu <hkliu@mail.edu.cn>

This code is distributed under the Perl Artistic License 
( http://language.perl.com/misc/Artistic.html ) 
and may be freely used, distributed and modified.
Retain the contribution notices and credits.
```
