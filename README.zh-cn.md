hustthesis
==========

[![Latest Document](https://img.shields.io/github/v/release/hust-latex/hustthesis?label=手册-示例)](https://github.com/hust-latex/hustthesis/releases/latest/download/hustthesis.pdf)
[![GitHub Release](https://img.shields.io/github/v/release/hust-latex/hustthesis?label=下载)](https://github.com/hust-latex/hustthesis/releases/latest)
[![CTAN](https://img.shields.io/ctan/v/hustthesis?label=CTAN)](https://www.ctan.org/pkg/hustthesis)
![GitHub repo size](https://img.shields.io/github/repo-size/hust-latex/hustthesis)

>   To see English version, [click me](https://github.com/hust-latex/hustthesis/blob/master/README.md).

非官方[华中科技大学](http://www.hust.edu.cn) LaTeX 学位论文文档类（模板）。
使用前请阅读[使用手册](https://github.com/hust-latex/hustthesis/releases/latest/download/hustthesis.pdf)，其中阐述了文档类的使用方法和注意事项。

## 要求

为了获得最佳体验，请使用 [TeX Live 2025](https://www.tug.org/texlive/) 或更高版本。
编译文档需要使用 XeLaTeX 或 LuaLaTeX。

## 安装

有以下几种方式可以安装和更新该模板，请选择最适合您的方法。

### 在线使用

您可以直接使用第三方 LaTeX 线上编译平台模板库 [TeXPage](https://www.texpage.com/template/4d9fefbf-2d5d-4d89-802d-124530cab9cf)。

您也可以下载 [hustthesis-user.zip](https://github.com/hust-latex/hustthesis/releases/latest/download/hustthesis-user.zip)，上传至相应平台。

### 本地安装

您可以从 [GitHub Releases](https://github.com/hust-latex/hustthesis/releases/latest) 下载[hustthesis-user.zip](https://github.com/hust-latex/hustthesis/releases/latest/download/hustthesis-user.zip)，并解压到合适的目录使用。

如果您希望完整安装该模板，可以使用 TeX Live 等 TeX 仓库管理工具。
这种方式将从 CTAN 下载该模板并将所有必需的文件安装到 TeX 目录结构（TDS）中。
命令行用户可以使用以下命令：
```bash
tlmgr [--usermode] install hustthesis
tlmgr [--usermode] update hustthesis
```

如果您是开发者，想要参与项目开发，或者希望在正式发布之前体验最新功能，可以从 GitHub 克隆该仓库，并使用 `l3build` 或 `make` 安装模板。

## 免责声明

此模板为个人开发，如果因为使用这份模板蒙受了任何包括但不限于经济、学术上的损失，作者将不承担任何责任。

## 开源协议

模板 v1.x 原作者为 [许铖](https://github.com/xu-cheng)。
后续 v2.x.x 版本由 [黄宇希](https://github.com/huangyxi) 制作和维护。
该项目采用 LPPL v1.3c 许可证。请随意使用。
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
