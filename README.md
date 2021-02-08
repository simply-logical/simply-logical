# Simply Logical: Intelligent Reasoning by Example #
[![Licence](https://img.shields.io/github/license/simply-logical/simply-logical.svg)](https://github.com/simply-logical/simply-logical/blob/master/LICENCE)
[![PDF](https://img.shields.io/badge/read-PDF-green.svg)](https://github.com/simply-logical/simply-logical/releases/download/v1.0/SL.pdf)
[![Online](https://img.shields.io/badge/read-online-green.svg)](https://book.simply-logical.space)  
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.1156977.svg)](https://doi.org/10.5281/zenodo.1156977)
[![Join the chat at https://gitter.im/simply-logical/simply-logical](https://badges.gitter.im/Simply-Logical/Simply_Logcal.svg)](https://gitter.im/simply-logical/simply-logical?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

![Simply Logical cover](src/img/SLfront.gif "Simply Logical cover")

*by [Peter Flach](https://www.cs.bris.ac.uk/~flach/index.html), then at [Tilburg University](https://www.tilburguniversity.nl/), the Netherlands*  
[John Wiley](https://www.wiley.com/) 1994, xvi + 240 pages, ISBN 0471 94152 2  
Reprinted: December 1994, July 1998.

This book is no longer available through John Wiley publishers. You can download a free PDF copy or view an online version.

## PDF version ##
[![PDF](https://img.shields.io/badge/read-PDF-green.svg)](https://github.com/simply-logical/simply-logical/releases/download/v1.0/SL.pdf)  
The PDF version of the book is available as a [*GitHub release*](https://github.com/simply-logical/simply-logical/releases/tag/v1.0).

## Online version ##
[![Online](https://img.shields.io/badge/read-online-green.svg)](https://book.simply-logical.space)  
The online version of the book is hosted on [*GitHub Pages*](https://book.simply-logical.space).
It is built with [Jupyter Book](https://jupyterbook.org/) and [SWISH](https://swish.swi-prolog.org/), the online version of [SWI-Prolog](https://swi-prolog.org/).

### Prolog code blocks not working ###
If the interactive Prolog code blocks are not working for you in the online version of the book, please ensure that 3rd party cookies are enabled in your web browser.

### Error in the book ###
If you find an error in the online version of the book, please open a [*GitHub issue*](https://github.com/simply-logical/simply-logical/issues).

### Building the book ###
1. Pull the book repository
   ```bash
   git clone https://github.com/simply-logical/simply-logical.git

   cd simply-logical
   ```
2. Install [*Jupyter Book*](https://pypi.org/project/jupyter-book/) with the
   [`sphinx-prolog`](https://pypi.org/project/sphinx-prolog/) and
   [`sphinx-multitoc-numbering`](https://pypi.org/project/sphinx-multitoc-numbering/)
   extensions
   ```bash
   pip install -r requirements.txt
   ```
3. Build the book
   ```bash
   jb build .
   ```
4. Open the html build
   ```bash
   open _build/html/index.html
   ```
   or run it as a server
   ```bash
   python3 -m http.server --directory _build/html
   open http://localhost:8000
   ```
