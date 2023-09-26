[![PDF](https://img.shields.io/badge/read-PDF-green.svg)](https://github.com/simply-logical/simply-logical/releases/download/v1.0/SL.pdf)
[![Online](https://img.shields.io/badge/read-online-green.svg)](https://book.simply-logical.space)  
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.1156977.svg)](https://doi.org/10.5281/zenodo.1156977)
[![arXiv](https://img.shields.io/badge/arXiv-2208.06823-red.svg)](https://arxiv.org/abs/2208.06823)  
[![Licence](https://img.shields.io/badge/Licence-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://github.com/simply-logical/simply-logical/blob/master/LICENCE)  
[![Join the chat at https://gitter.im/simply-logical/simply-logical](https://badges.gitter.im/Simply-Logical/Simply_Logcal.svg)](https://gitter.im/simply-logical/simply-logical?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

# Simply Logical – Intelligent Reasoning by Example (Fully Interactive Online Edition) #

![Simply Logical cover](src/img/SLfront.gif "Simply Logical cover")

*by [Peter Flach](http://people.cs.bris.ac.uk/~flach/index.html), then at [Tilburg University](https://www.tilburguniversity.edu/), the Netherlands*  
[John Wiley](https://www.wiley.com/en-gb) 1994, xvi + 240 pages, ISBN 0471 94152 2  
Reprinted: December 1994, July 1998.

## History ##
"Simply Logical -- Intelligent Reasoning by Example" by Peter Flach was first published by John Wiley in 1994. It could be purchased as book-only or with a 3.5 inch diskette containing the Prolog programs printed in the book (for various operating systems).

In 2007 the copyright reverted back to the author and book and programs have been freely available [online](http://people.cs.bris.ac.uk/~flach/SimplyLogical.html) ever since. The print version is no longer available through John Wiley publishers.

In 2015, as a pilot, we ported most of the original book into an online, interactive website using SWI-Prolog's [SWISH platform](https://swish.swi-prolog.org/). Since then, we created the *Simply Logical* open source organisation committed to maintaining a suite of freely available interactive online educational resources about Artificial Intelligence and Logic Programming with Prolog. Visit our organisation's [website](https://simply-logical.space/) and [GitHub profile](https://github.com/simply-logical) for more details.

This book is no longer available through John Wiley publishers.
You can download a free PDF copy or view an online version.

## PDF version ##
[![PDF](https://img.shields.io/badge/read-PDF-green.svg)](https://github.com/simply-logical/simply-logical/releases/download/v1.0/SL.pdf)  
The PDF version of the original book is available as a [*GitHub release*](https://github.com/simply-logical/simply-logical/releases/tag/v1.0).

## Online version ##
[![Online](https://img.shields.io/badge/read-online-green.svg)](https://book.simply-logical.space)  
The online version of the book is hosted on [*GitHub Pages*](https://book.simply-logical.space).
It is built with [Jupyter Book](https://jupyterbook.org/) and [SWISH](https://swish.swi-prolog.org/), the online version of [SWI-Prolog](https://swi-prolog.org/).
It follows the structure of the original print version, with minor corrections and additions as explained in the [preface](https://book.simply-logical.space/src/text/0_preface/_preface.html).

### Prolog code blocks not working ###
If the interactive Prolog code blocks are not working for you in the online version of the book, please ensure that third-party cookies are enabled in your web browser.

### Error in the book ###
If you find an error in the online version of the book, please open a [*GitHub issue*](https://github.com/simply-logical/simply-logical/issues).

### Building the book ###
1. Pull the book repository
   ```bash
   git clone https://github.com/simply-logical/simply-logical.git

   cd simply-logical
   ```
2. Install [*Jupyter Book*](https://pypi.org/project/jupyter-book/) with the
   [`sphinx-prolog`](https://pypi.org/project/sphinx-prolog/) extension
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
