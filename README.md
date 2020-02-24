[![CC BY-SA 4.0][cc-by-sa-shield]][cc-by-sa]
# Simulation of an Electron-Beam Scanner for Profile Monitoring in Short Bunch Machines

## Intro
This repository contains my work for my final thesis in the Electrical and Computer Engineering department (THMMY) of the Aristotle University of Thessaloniki (AUTh), Greece.

The core of the work was done during my 1-year work at CERN as a Technical Student, years 2014-2015. 
The thesis was presented in my university July 5th, 2017, and is uploaded here: https://ikee.lib.auth.gr/record/292247/.

## Repository structure

 * **`./`** (root directory)

    * `main.tex`: the "master" document, which includes everything else. It's the file to compile

    * `main.pdf` the final output

    * `auth-thesis.cls` class file for the thesis. Contains information about the cover and the style of the document

    * `references.bib` BibTeX bibliography file

    * `hellas.bst` greek bibliography style based on "plain"

    * `iso-8859-7.def` Greek input encoding file   

    * `landscapefix.tex` configuration file for proper headers and footers in landscape pages in the document

* **`code/`**: directory containing code files being imported as listings in the main document

* **`dictionary/`**: directory containing a greek dictionary file, useful for correction of the text in the editor while writing the document.

* **`figures/`**: directory containing all the plots and scientific figures used in the document, organised in sub-folders

* **`images/`**: directory containing all images or pictures used in the document

## Compiling
To compile the whole document follow the steps:

1. Run PdfLaTeX

2. Run Bib(la)tex

3. Manually modify `main.bbl` by adding `\selectlanguage{english}` on the 2nd line and last line, in order to correctly display Latin and Greek characters in bibliography of the final text

4. Run PdfLaTeX two more times


## Useful resources
In the process of writing my thesis, I found the following links useful:

* [How to Write your Thesis](http://www.ldeo.columbia.edu/~martins/sen_sem/thesis_org.html): guidelines on writing a thesis from the university of Columbia.

* [PhD Starter kit](https://raoofphysics.github.io/phd-starter-kit/): general tips on the workflow and tools that can be used while writing a (PhD) thesis.

* [Stack overflow question on Git+LaTeX](http://stackoverflow.com/questions/6188780/git-latex-workflow): explanation and insights for the combination of the git + LaTeX workflow.

* [LaTeX - Wikibooks](https://en.wikibooks.org/wiki/LaTeX): wikibook containing A LOT of information about LaTeX in a clear and concise way. I recommend reading or at least skimming the whole book before attempting to write any LaTeX document of considerable length.

* [DBlab, NTuA](http://web.dbnet.ntua.gr/en/diplomas.html): The website containing the LaTeX template on which this thesis was based.

## Thesis abstract
The Compact LInear Collider (CLIC) will use a novel acceleration scheme in which energy extracted from a very intense beam of relatively low-energy electrons (the Drive Beam) is used to accelerate a lower intensity Main Beam to very high energy. The high intensity of the Drive Beam, with pulses of more than 1015 electrons, poses a challenge for conventional profile measurements such as wire scanners. Thus, new non-invasive profile measurements are being investigated.

One candidate is the Electron Beam Scanner. A probe beam of low-energy electrons crosses the accelerator beam perpendicularly. The probe beam is deflected by the space-charge fields of the accelerator beam. By scanning the probe beam and measuring its deflection with respect to its initial position, the transverse profile of the accelerator beam can be reconstructed.

Analytical expressions for the deflection exist in the case of long bunches, where the charge distribution can be considered constant during the measurement. In this thesis, we consider the performance of an electron beam scanner in an accelerator where the bunch length is much smaller than the probe-beam scanning time. In particular, the case in which the bunch length is shorter than the time taken for a particle of the probe beam to cross the main beam is difficult to model analytically. We have developed a simulation framework allowing this situation to be modelled.


## License
This work is licensed under a [Creative Commons Attribution-ShareAlike 4.0
International License][cc-by-sa].

[![CC BY-SA 4.0][cc-by-sa-image]][cc-by-sa]

[cc-by-sa]: http://creativecommons.org/licenses/by-sa/4.0/
[cc-by-sa-image]: https://licensebuttons.net/l/by-sa/4.0/88x31.png
[cc-by-sa-shield]: https://img.shields.io/badge/License-CC%20BY--SA%204.0-lightgrey.svg