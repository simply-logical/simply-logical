# Simply Logical: Intelligent Reasoning by Example #
[![DOI](https://zenodo.org/badge/43899045.svg)](https://zenodo.org/badge/latestdoi/43899045)
[![Join the chat at https://gitter.im/simply-logical/simply-logical](https://badges.gitter.im/Simply-Logical/Simply_Logcal.svg)](https://gitter.im/simply-logical/simply-logical?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

![](img/SLfront.gif "Simply Logical cover")

*by [Peter Flach](https://www.cs.bris.ac.uk/~flach/index.html), then at [Tilburg University](http://www.tilburguniversity.nl/), the Netherlands*  
[John Wiley](http://www.wiley.co.uk/) 1994, xvi + 240 pages, ISBN 0471 94152 2  
Reprinted: December 1994, July 1998.

This book is no longer available through John Wiley publishers. You can download a free PDF copy or view its online version - see below for details.

## PDF version ##
The `PDF` version of my book is available as a GitHub release [here](https://github.com/flach/simply-logical/releases/download/v1.0/SL.pdf).  
The release page with some notes is available [here](https://github.com/flach/simply-logical/releases/tag/v1.0).

## Online version ##
The online version of my book is hosted at *GitHub Pages* and was built with use of [Bootstrap](http://getbootstrap.com/) and [SWISH](http://swish.swi-prolog.org/), the online version of [SWI-Prolog](http://swi-prolog.org/).  
You can view it [here](http://book.simply-logical.space).

### Prolog code blocks not working ###
If Prolog blocks are not working for you in the online version of the book please make sure that 3rd party cookies are enabled in your web browser.

### Error in the book ###
If you found an error in the online version of the book please file an **issue** in [this](https://github.com/flach/simply-logical/issues) GitHub repository.

# Fixes #
- [X] Figure 4.1 is missing.
- [X] Fix rendering of *¨*, *Ô*, etc..

[^\x00-\x7F]

| org | rep      |
| --- | ---      |
| ¢   | &prime;  |
| ¨   | &rarr;   |
| ¥   | &bull;   |
| É   | &hellip; |
| Æ   | &#x25A1; |
| ®   | &#8709;  |
| ë é | &cup;    |
| ô   | &and;    |
| ò   | &or;     |
| ¯   | &not;    |
| Â   | &not;    |
| Ç   | &harr;   |
| ¼   | &equiv;  |
| Š   | &auml;   |
| Ÿ   | &uuml;   |
| Ñ   | &mdash;  |
| --- | ---      |
| $   | &exist;  |
| "   | &forall; |
| --- | ---      |
| Ô   | &lsquo;  |
| Õ   | &rsquo;  |
| •   | &iuml;   |
| Ž   | &eacute; |
| —   | &oacute; |
| «   | &times;  |
| ³   | &ge;     |
| è   | &Euml;   |
| ¾   | &aelig;  |
| ê   | &sube;   |
| --- | ---      |
| È   | NULL     |

- [X] Fix repeating header's ids.
- [X] Merge external changes (Dropbox).
- [X] Split `htm` files into proper modules.
