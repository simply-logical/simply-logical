---
title: Simply Logical -- Intelligent Reasoning by Example (Online Edition)
tags:
  - Textbook
  - Interactive
  - Online Edition
  - Jupyter Book
  - SWI-Prolog
  - ProbLog
  - Artificial Intelligence
  - Logic Programming
authors:
  - name: Peter Flach
    orcid: 0000-0001-6857-5810
    affiliation: 1
  - name: Kacper Sokol
    orcid: 0000-0002-9869-5896
    affiliation: 1
affiliations:
  - name: Department of Computer Science, University of Bristol
    index: 1
date: 01 August 2022
bibliography: paper.bib
---

# Summary #

<!-- Does the paper tell the "story" of how the authors came to develop it,
     or what their expertise is? -->
"Simply Logical -- Intelligent Reasoning by Example" by Peter Flach was first
published by John Wiley in 1994 [@flach1994simply].
It could be purchased as book-only or with a 3.5 inch diskette containing the
SWI-Prolog [@wielemaker2012swiprolog] programmes printed in the book
(for various operating systems).
In 2007 the copyright reverted back to the author at which point the book and
programmes were made freely available online;
the print version is no longer distributed through John Wiley publishers.
In 2015, as a pilot, we ported most of the original book into an online,
interactive website using SWI-Prolog's SWISH platform [@wielemaker2015swish].
Since then, we launched the *Simply Logical* open source
organisation^[https://simply-logical.space/] committed to maintaining
a suite of freely available interactive online educational
resources^[https://github.com/simply-logical/] about
Artificial Intelligence and Logic Programming with Prolog.
With the advent of new educational technologies we were inspired to re-build
the book from the ground up using the Jupyter Book platform [@jupyter2020book]
expanded with a collection of bespoke plugins that implement, among other
things, interactive SWI-Prolog code blocks that can be executed directly in
a web browser.
This new version is more modular, easier to maintain and possible to split into
custom teaching modules, in addition to being modern-looking, visually appealing
and compatible with a range of (mobile) devices with varying screen sizes.

# Artificial Intelligence and Logic Programming with SWI-Prolog #

<!-- learning objectives -->
TODO

<!-- contents summary -->
<!-- Does the paper describe the learning materials and sequence?  -->
TODO

<!-- instructional design -->
TODO

<!-- experience of use in teaching and learning situations -->
<!-- Does it describe how it has been used in the classroom or other settings,
     and how someone might adopt it? -->
<!-- Does the documentation explain how someone would adopt the module,
     and include examples of how to use it? -->
TODO

TODO:
  Mention the *Artificial Intelligence with Logic Programming*
  undergraduate course^[https://coms30106.github.io].

TODO:
  Mention the *Computational Logic for Artificial Intelligence*
  master's course Interactive Artificial Intelligence Centre for Doctoral
  Training^[https://www.bristol.ac.uk/cdt/interactive-ai/] (IAI CDT).

# Statement of Need #

<!-- Do the authors clearly state the need for this module and who the target
     audience is? -->
<!-- How these contribute to computationally enabled teaching and learning and
     how they might be adopted by others -->
This online book offers an intuitive and comprehensive introduction to
*artificial intelligence and logic programming* in the form of an accessible
educational resource with a modern feel and look.
The learning experience is enhanced with *exercises* and
*practical coding examples*;
the latter are delivered through interactive code boxes that can be executed
directly in the web browser, thus fulfilling the original vision for the
paperback edition that was curtailed by the lack of appropriate technologies at
the time of its publication.
It is written with three kinds of readers in mind:
*artificial intelligence* researchers or practitioners;
*logic programming* researchers or practitioners; and
students (advanced undergraduate or graduate level) in both fields.
The book can be used as a teaching aid, but it is also suitable for self-study.
It can be adopted as is or the content can be rearranged into a bespoke learning
resource, which is made possible due to the modular design of the book source
that is split into a collection of files based on their type:

* text is written in Markdown -- each sub-section is placed in a separate file;
* code is published as SWI-Prolog scripts; and
* figures are available as Scalable Vector Graphics (SVG).

All of this content is published on
GitHub^[https://github.com/simply-logical/simply-logical], which allows to
easily reuse these materials, incorporate them into bespoke courses or
adapt them into alternative educational resources such as practical
training sessions.

![Interactive SWI-Prolog code box based on SWISH. A code listing (left) can be turned into an interactive code box (right) by pressing the "play" button placed in the top-right corner.](codebox.png){width=95%}

From a technical perspective, the development of the online edition required us
to implement a collection of Jupyter Book plugins (that are also compatible with
Sphinx) spanning functionality specific to
SWI-Prolog^[https://www.swi-prolog.org] [@wielemaker2012swiprolog],
later extended to cplint^[https://cplint.ml.unife.it] [@riguzzi2018foundations]
and ProbLog^[https://dtai.cs.kuleuven.be/problog] [@deraedt2007problog]
programming languages.
Specifically, we released
`sphinx-prolog`^[https://github.com/simply-logical/sphinx-prolog], which
allows to embed interactive SWI-Prolog and cplint code boxes -- see Figure 1 --
by including their source directly in a Markdown file via a custom Prolog code
listing or load the programme from an external code file.
This plugin is based on SWISH^[https://swish.swi-prolog.org] --
SWI-Prolog for Sharing -- which is an online, interactive SWI-Prolog coding
environment akin to Jupyter Notebooks [@wielemaker2015swish].
The `sphinx-problog`^[https://github.com/simply-logical/sphinx-problog]
extension, on the other hand, allows to embed interactive ProbLog code boxes,
the implementation of which is based on the online execution environment
underpinning the code examples published as part of the ProbLog website.
Additionally, the implementation of these plugins prompted us to explore
alternative technologies for building (interactive) training resources,
which in turn has inspired a prototype of a new publishing workflow in which
multiple artefacts such as online documents, slides and computational notebooks
can be composed from a unified collection of source materials [@sokol2021you].

# Acknowledgements #

The development of `sphinx-prolog` and `sphinx-problog` Jupyter Book plugins
was supported by the TAILOR Network -- an ICT-48 European AI Research
Excellence Centre funded by EU Horizon 2020 research and innovation programme,
grant agreement number 952215.

# References #
