# Contributing Guide #

Thank you for considering contributing to the Simply Logical book.
This guide offers general information about the structure of the project as well as a high-level overview of a workflow that is put in place to streamline the contribution process.

## Communication and Support ##

[![Chat via Slack](https://img.shields.io/badge/slack-chat-yellow.svg?logo=slack)][slack]
[![Chat on Gitter](https://img.shields.io/badge/gitter-chat-purple.svg?logo=gitter)][gitter]
[![Join Mailing List](https://img.shields.io/badge/google%20groups-discuss-orange.svg?logo=googlenews)][google_group]
[![Send an Email](https://img.shields.io/badge/email-ask-green.svg?logo=mail.ru)][email]
[![Open GitHub Issue](https://img.shields.io/badge/github-report%20issue-blue.svg?logo=github)][gh_issue]

If you want to get in touch, choose one of the following methods based on the problem that you are facing:

- reach out via [Slack][slack] or [Gitter][gitter] to chat about the contents of this repository or seek support;
- join the [Google Group][google_group] to stay up to date with the project and discuss any of its aspects;
- drop us an [email][email] if you need to ask a private question or raise a concern; and
- open a [GitHub issue][gh_issue] to report a problem with this learning resource.

---

The interactive [SWISH][swish] code blocks embedded in the book are created with the [`sphinx-prolog`][sphinx_prolog] extension.
Prior to reporting any issues with these elements, please familiarise yourself with the [documentation][sphinx_prolog_doc] of this plugin.
**Technical problems** with code boxes and the extension and should be reported in its GitHub repository [simply-logical/sphinx-prolog][sphinx_prolog_issue];
whereas **usage issues** ought to be reported in in the GitHub repository of the book [simply-logical/simply-logical][gh_issue].

## Project Structure ##

The book is built with [Jupyter Book][jb].
Its source materials ([`src`](src) directory) are split into separate folders based on the content type:

- figures are located in [`src/fig`](src/fig);
- source code used to populate interactive code blocks is stored in [`src/code`](src/code);
- text to populate exercise boxes is placed in [`src/ex`](src/ex); and
- main text of the book -- one file per section -- is held in [`src/text`](src/text).

Additionally, supporting images are stored in the [`src/img`](src/img) directory, and the front page of the book is sourced from the [`src/simply-logical.md`](src/simply-logical.md) file.

## Contribution Workflow ##

[![Licence](https://img.shields.io/badge/Licence-CC%20BY--NC--SA%204.0-lightgrey.svg)][licence]
[![CLA](https://img.shields.io/badge/CLA-Apache%202.2-red)][icla]

The book is published under the [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International][licence] licence.
Additionally, any contributions to this repository are subject to the [Apache Individual Contributor Licence Agreement V2.2][icla] and **by opening a pull request you implicitly agree to the terms described therein.
(See the [Apache Contributor Agreements][aca] page for more details.)

[![Open GitHub Issue](https://img.shields.io/badge/github-report%20issue-blue.svg?logo=github)][gh_issue]

Before contributing to the repository, please open an [issue][gh_issue] to report and discuss the problem you encounter.
For build related issues, please include the versions of your *operating system*, *Python* and *packages* (`pip list`) to make the debugging easier.
If possible, include the error trace and a minimal example that can be used to reproduce the problem.
To help you with issue reporting, two dedicated templates are in place: one for the book content and one for any technical issues with the book.

[![Open GitHub Pull Request](https://img.shields.io/badge/github-open%20pull%20request-blue.svg?logo=github)][gh_pr]

Contribute your changes to a dedicated branch in a fork of the repository.
When ready, open a [pull request][gh_pr] to initiate the process of integrating your contributions into the repository -- a generic pull request template will be loaded automatically for your convenience.
Please note that the book is built and (lightly) tested with a [GitHub Action][tests];
it builds the book and checks for missing or invalid URLs.

> If you have made a significant contribution, consider adding your name to the [`CONTRIBUTORS`][contributors] file.

## Known Issues ##

We are aware of the following issues with the book, which cannot be easily fixed.

- [Long code blocks][iss1] (the `build-file` parameter set to `true`) do not work when previewing a local build of the book as they require certain files to be uploaded to GitHub.

[slack]: https://simply-logical.slack.com/
[gitter]: https://gitter.im/simply-logical/
[google_group]: https://groups.google.com/forum/#!forum/simply-logical
[email]: mailto:contact@simply-logical.space
[gh_issue]: https://github.com/simply-logical/simply-logical/issues
[gh_pr]: https://github.com/simply-logical/simply-logical/pulls
[sl_home]: https://simply-logical.space/
[book_page]: https://book.simply-logical.space/
[sphinx_prolog]: https://github.com/simply-logical/sphinx-prolog
[sphinx_prolog_issue]: https://github.com/simply-logical/sphinx-prolog/issues
[sphinx_prolog_doc]: https://book-template.simply-logical.space/
[swish]: https://swish.swi-prolog.org/
[contributors]: https://github.com/simply-logical/simply-logical/blob/master/CONTRIBUTORS
[licence]: https://github.com/simply-logical/simply-logical/blob/master/LICENCE
[jb]: https://jupyterbook.org/
[icla]: https://www.apache.org/licenses/icla.pdf
[aca]: https://www.apache.org/licenses/contributor-agreements.html
[test]: https://github.com/simply-logical/simply-logical/actions/workflows/build-and-deploy.yml
[iss1]: https://book-template.simply-logical.space/src/text/sphinx_prolog_swish.html#loading-long-swish-scripts
