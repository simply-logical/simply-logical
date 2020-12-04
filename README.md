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
1. Install *Jupyter Book*; either a stable version
   ```bash
   pip install jupyter-book
   ```
   or the latest development version
   ```bash
   pip install git+https://github.com/executablebooks/jupyter-book.git
   ```
2. Build the book
   ```bash
   jb build .
   ```
3. Open the html build
   ```bash
   open _build/html/index.html
   ```
   or run it as a server
   ```bash
   python3 -m http.server --directory _build/html
   open http://localhost:8000
   ```

# TODO #
- [ ] TODO(Peter): fix TODO tags
- [ ] TODO(Peter): hacked named paragraphs (search for `&nbsp;`) into markdown sections (e.g., 1.2.1) -- will show up on the right in the content
    - [ ] TODO (Kacper) prevent sphinx from numbering these entries (toc `:maxdepth:`)
- [ ] TODO(Peter): adjust figure width
- [ ] TODO(Peter): typographical consistency
- [ ] TODO(Peter): point the [book website](https://www.cs.bris.ac.uk/~flach/SimplyLogical.html) to the [online edition](https://book.simply-logical.space)

- [ ] TODO(Kacper): automated numbering:
    * sections
- [ ] TODO(Kacper): fix the mismatch of references to items in itemize -- they are lower case roman numbers in the book and Jupyter Book has its own style
    * step (..+) maybe with italics somehow
    * these can be letters or numbers or roman

- [ ] TODO(Kacper): automated numbering and referencing of **exercises**
- [ ] TODO(Kacper): some of the footnotes have messed up numbering (check github issues)
