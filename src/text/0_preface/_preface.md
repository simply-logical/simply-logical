(part:preface)=
# Preface to the online edition #

Why spend all this effort to produce an online version of a textbook that is over 25 years old? 
This is an excellent question, with several equally good answers. 

Perhaps most importantly, the online format, built with [Jupyter Book](https://jupyterbook.org/) and [SWISH](https://swish.swi-prolog.org/), matches the original concept of the book very well. 
Here is how I explained the presentation style in the 1994 Author's Preface: 

> As indicated by the title, this book presents intelligent reasoning techniques *by example*. This is meant to stress that every technique is accompanied by a Prolog program implementing it. These programs serve two didactic purposes. By running them, one can get a feeling what a particular technique is all about. But perhaps more importantly, the declarative reading of each program is an integral part of the explanation of the technique it implements. For the more elaborate programs, special attention is paid to their stepwise development, explaining key issues along the way. Thus, the book's focus is not just on the question 'How is this done in Prolog?', but rather on the question 'How should I solve this problem, were I to start from scratch?' In other words, the philosophy of this book is 'teaching by showing, learning by doing'.

My hope was that the reader would mount the accompanying 3.5'' diskette into their computer, and try out the Prolog programs alongside reading the book. While this was perhaps optimistic back then, the online format available today integrates the 'showing' and 'doing' sides of the educational coin very well, and there is now really no excuse for not playing around with the code to gain a better understanding of the introductory and advanced topics discussed in these (web) pages. 

Working on the online version gave me a much better appreciation of what is possible with today's powerful authoring and publishing tools. Having had a longstanding interest in scientific and educational publishing, I increasingly felt that the 'traditional' tools and formats -- $\LaTeX$, Microsoft Word, PowerPoint, PDF, HTML -- are too closely linked to 'old school' paper-based publishing which makes them less conducive for further progress. Novel platforms such as Jupyter notebooks and Jupyter Book allow authors to effortlessly mix different formats and languages -- markdown, hyperlinks, mathematical typesetting, code -- in a typographically pleasing way. In essence, these platforms do for *authoring* what PDF, HTML, XML etcetera have done for *publishing*. While this project was a conversion from a paper-based book, I look forward to writing my next book entirely from scratch in this liberating format. 

But none of this would matter if the *Simply Logical* content was by now hopelessly outdated -- as some may think indeed it is. After all, aren't today's AI systems, powered by machine learning, so powerful that they can be applied to acquire the ability to reason intelligently from data? Anyone who believes that has never tried a query such as 'books **not** written by Peter Flach' on their favourite machine learning-powered search engine. Learning and reasoning are broadly complementary skills requiring complementary techniques, much as a human's cognitive abilities are powered by complementary 'thinking fast' and 'thinking slow' skills. Intelligent reasoning has always been and continues to be a core topic in the AI syllabus, and logic-based declarative languages such as Prolog remain key ingredients. 


````{tip}
Having used the book for undergraduate and postgraduate teaching for many years, I decided against making major structural changes or adding substantial new material. I have, of course, taken the opportunity to include small improvements and corrections, such as using anonymous variables wherever appropriate, and slight punctuation improvements in clauses and queries. 
I have also inserted further examples from my teaching, formatted in boxes like this one.
In parallel I am working on a separate {ref}`ch:glossary` that can be read either alongside or separate from the main text. 
````


Finally, I must pay tribute to the very significant and decisive role played by Kacper Sokol in creating and shaping this online resource. The work started in 2015, when Kacper converted the original content authored in a legacy version of Microsoft Word to static HTML. It was then integrated with [SWISH (SWI-Prolog for SHaring)](https://swish.swi-prolog.org/), so that the Prolog code could be run from within the browser. In 2020 Kacper began work on a new version based on Jupyter Book and the Sphinx Python Documentation Generator [^*_].
The result is a modern-looking, platform-independent, aesthetically pleasing online format that sets a great example for what is possible today in computer-supported academic publishing. To a very large extent this is due to Kacper's initiative and technical skills. It has been a great pleasure and a privilege to work with him, and I have learned a great deal in the process. 


[^*_]: You can find out more about the `sphinx-prolog` extension at [https://github.com/simply-logical/sphinx-prolog](https://github.com/simply-logical/sphinx-prolog). 
