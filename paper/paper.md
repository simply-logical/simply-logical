---
title: |
  Simply Logical:
  Intelligent Reasoning by Example (Online Edition)
tags:
  - Textbook
  - Interactive
  - Online Edition
  - Jupyter Book
  - SWI Prolog
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
date: 01 July 2022
bibliography: paper.bib
---

# Summary #

TODO:
  It's an online edition of [@flach1994simply],
  with its SWI Prolog [@wielemaker2012swiprolog] code examples
  made interactive.

The online edition is based on the Jupyter Book platform [@jupyter2020book]
expanded with a collection of bespoke plugins implementing interactive
SWI Prolog code blocks that can be executed directly in a web browser.

# Artificial Intelligence and Logic Programming with SWI Prolog #

<!-- learning objectives -->
TODO

<!-- contents summary -->
TODO

<!-- instructional design -->
TODO

<!-- experience of use in teaching and learning situations -->
TODO

TODO:
  Mention the *Artificial Intelligence with Logic Programming*
  undergraduate course^[https://coms30106.github.io].

TODO:
  Mention the *Computational Logic for Artificial Intelligence*
  master's course.

# Statement of Need #

<!-- how these contribute to computationally enabled teaching and learning
     how they might be adopted by others -->
TODO

The book source is split into a collection of files based on their type:

* text is written in Markdown -- each sub-section is placed in a separate file;
* code is published as SWI Prolog scripts; and
* figures are available as Scalable Vector Graphics (SVG).

All of this content is published on
GitHub^[https://github.com/simply-logical/simply-logical], which allows to
easily reuse these materials, incorporate them into bespoke courses or
adapt them into alternative educational resources such as practical
training sessions.

![Interactive SWI Prolog code box based on SWISH.](codebox.png){width=95%}

From a technical perspective, the development of the online edition required us
to implement a collection of Jupyter Book plugins spanning functionality
specific to SWI Prolog^[https://www.swi-prolog.org] [@wielemaker2012swiprolog],
later extended to cplint^[https://cplint.ml.unife.it] [@riguzzi2018foundations]
and ProbLog^[https://dtai.cs.kuleuven.be/problog] [@deraedt2007problog]
programming languages.
Specifically, we released
`sphinx-prolog`^[https://github.com/simply-logical/sphinx-prolog], which
allows to embed interactive SWI Prolog and cplint code boxes -- see Figure 1 --
by including their source directly in a Markdown file via a custom Prolog code
listing or load the programme from an external code file.
This plugin is based on SWISH^[https://swish.swi-prolog.org] --
SWI Prolog for Sharing -- which is an online, interactive SWI Prolog coding
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
