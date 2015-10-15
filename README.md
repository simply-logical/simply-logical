# Simply Logical: Intelligent Reasoning by Example #


![](SLfront.gif "Simply Logical cover")

*by [Peter Flach](https://www.cs.bris.ac.uk/~flach/index.html), then at [Tilburg University](http://www.tilburguniversity.nl/), the Netherlands*  
[John Wiley](http://www.wiley.co.uk/) 1994, xvi + 240 pages, ISBN 0471 94152 2  
Reprinted: December 1994, July 1998.

This book is no longer available through John Wiley publishers. You can download a free PDF copy or view its online version - see below for details.

## PDF version ##
The `PDF` version of my book is available as a GitHub release [here](https://github.com/So-Cool/simply-logical/releases/download/v1.0/SL.pdf).  
The release page with some notes is available [here](https://github.com/So-Cool/simply-logical/releases/tag/v1.0).

## Online version ##
The online version of my book is hosted at *GitHub Pages* and was built with use of [Bootstrap](http://getbootstrap.com/) and [SWISH Prolog](http://swish.swi-prolog.org/).  
You can view it [here](http://so-cool.github.io/simply-logical).

### Prolog code blocks not working ###
If Prolog blocks are not working for you in the online version of the book please make sure that 3rd party cookies are enabled in your web browser.

### Error in the book ###
If you found an error in the online version of the book please file an **issue** in [this](https://github.com/So-Cool/simply-logical) GitHub repository.

# Deploying to GitHub Pages #
To deploy changes introduced in `master` branch to `gh-pages` branch do (after committing all changes on `master` branch):
``` bash
git push origin master
git checkout gh-pages
git merge master
git push origin gh-pages
git checkout master
```

# To do #
- [ ] Fix PDF release.
- [ ] Figure 4.1 is missing.
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
- [ ] Merge external changes (Dropbox).
- [ ] Create better stylesheet.
- [X] Split `htm` files into proper modules.
