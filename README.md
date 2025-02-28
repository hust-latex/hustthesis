hustthesis
==========

[![Latest Document](https://img.shields.io/github/v/release/hust-latex/hustthesis?label=Docs)](https://github.com/hust-latex/hustthesis/releases/latest/download/hustthesis.pdf)
[![GitHub Release](https://img.shields.io/github/v/release/hust-latex/hustthesis?label=Release)](https://github.com/hust-latex/hustthesis/releases/latest)
[![CTAN](https://img.shields.io/ctan/v/hustthesis?label=CTAN)](https://www.ctan.org/pkg/hustthesis)
![GitHub repo size](https://img.shields.io/github/repo-size/hust-latex/hustthesis)

>   中文版[点击这里](https://github.com/hust-latex/hustthesis/blob/master/README.zh-cn.md)。

An Unofficial Thesis Template in LaTeX for [Huazhong University of Science and Technology](http://www.hust.edu.cn).
Before using, please read the [user manual](https://github.com/hust-latex/hustthesis/releases/latest/download/hustthesis.pdf), which describes how to use the document class and its precautions.

## Requirement

For the best experience, please use the [TeX Live 2025](https://www.tug.org/texlive/) or later.
Compiling the document requires either XeLaTeX or LuaLaTeX.

## Installation

The following methods are available for installing and updating the template.
Choose the method that best suits your needs.

### Online Usage
You can directly use the template from third-party LaTeX online compilation platform template libraries [TeXPage](https://www.texpage.com/en/template/4d9fefbf-2d5d-4d89-802d-124530cab9cf).

You can also download the [hustthesis-user.zip](https://github.com/hust-latex/hustthesis/releases/latest/download/hustthesis-user.zip), upload it to the corresponding platform.

### Local Installation

You can download the [hustthesis-user.zip](https://github.com/hust-latex/hustthesis/releases/latest/download/hustthesis-user.zip) from [GitHub Releases](https://github.com/hust-latex/hustthesis/releases/latest) and extract it to a suitable directory.

For a full installation of the package, you can use a TeX repository manager such as TeX Live.
This method will download the package from CTAN and install all required files to TeX Directory Structure (TDS).
For command-line users, the following commands can be used:

```bash
tlmgr [--usermode] install hustthesis
tlmgr [--usermode] update hustthesis
```

If you're a developer interested in contributing to the project's development, or simply want to try the latest features before they are officially released, you can clone the repository from GitHub and use either `l3build` or `make` to install the package.


## Disclaimer

This template is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

## License
The Original v1.x works were created by [Xu Cheng](https://github.com/xu-cheng).
Subsequent v2.x.x works were created by [Huang Yuxi](https://github.com/huangyxi).
The project is licensed under the LPPL v1.3c. Feel free to use it as you wish.
```
Copyright (C) 2013-2014 by Xu Cheng <xucheng@me.com>
              2014-     by hust-latex <https://github.com/hust-latex>
              2024-     by HUANG Yuxi <hustthesis@hyxi.dev>

This work may be distributed and/or modified under the
conditions of the LaTeX Project Public License, either
version 1.3c of this license or (at your option) any later
version. This version of this license is in
   https://www.latex-project.org/lppl/lppl-1-3c.txt
and the latest version of this license is in
   https://www.latex-project.org/lppl.txt
and version 1.3c or later is part of all distributions of LaTeX
version 2008 or later.

This work has the LPPL maintenance status "maintained".

The Current Maintainer of this work is HUANG Yuxi <hustthesis@hyxi.dev>.
```
