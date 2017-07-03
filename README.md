# thmmy-final-thesis #

## Intro ##
This repository includes my work for the my final thesis in the Electrical and Computer Engineering department (THMMY) of the Aristotle University of Thessaloniki (AUTh), Greece.

The core of the work was done during my 1-year work at CERN as a Technical Student, years 2014-2015. 
The thesis was presented in my university July 5th, 2017.

The thesis is written in LaTeX.

## Summary of repository structure ##

+ **./** (root directory)

    * *main.tex*: the "master" document, which includes everything else. It's the file to compile

    * *main.pdf*: the final output

    * *auth-thesis.cls*: class file for the thesis. Contains information about the cover and the style of the document

    * *references.bib*: BibTeX bibliography file

    * *hellas.bst*: greek bibliography style based on "plain"

    * *iso-8859-7.def*: Greek input encoding file. No idea why it's there

    * *landscapefix.tex*: configuration file for proper headers and footers in landscape pages in the document

* **code/**: directory containing code files being imported as listings in the main document

* **dictionary/**: directory containing a greek dictionary file, useful for correction of the text in the editor while writing the document.

* **figures/**: directory containing all the plots and scientific figures used in the document, organised in sub-folders

* **images/**: directory containing all images or pictures used in the document

* **referenced papers/**: directory containing all papers and documents mentioned in the bibliography 

## Compiling ##
To compile the whole document follow the steps:

1. Run PdfLaTeX

2. Run Bib(la)tex

3. Manually modify `main.bbl' by adding \selectlanguage{english} on the 2nd line and last line, in order to correctly display Latin and Greek characters in bibliography of the final text

4. Run PdfLaTeX two more times


## Useful sources ##
In the process of writing my thesis, I found the following links useful

* [How to Write your thesis](http://www.ldeo.columbia.edu/~martins/sen_sem/thesis_org.html): guidelines on writing a thesis from the university of Columbia

* [PhD Starter kit](https://raoofphysics.github.io/phd-starter-kit/): general tips on the workflow and tools that can be used while writing a (PhD) thesis

* [Stack overflow question on Git+LaTeX](http://stackoverflow.com/questions/6188780/git-latex-workflow): explanation and insights for the combination of the git + LaTeX workflow

* [LaTeX - Wikibooks](https://en.wikibooks.org/wiki/LaTeX): wikibook containing A LOT of information about LaTeX in a clear and concise way. I recommend reading or at least skimming the whole book before attempting to write any LaTeX document of considerable length

* [DBlab, NTuA](http://web.dbnet.ntua.gr/en/diplomas.html): The website containing the LaTeX template that on which thesis was based

* [Library Genesis](http://gen.lib.rus.ec/): Rich online site to download papers you otherwise need to pay for