#!/bin/bash

find -E . -regex '.*\.(bbx|cbx|dbx|lbx)' | xargs -J % cp % ~/texmf/tex/latex/biblatex-apa/
cp bibtex/bib/*.bib ~/texmf/bibtex/bib/biblatex-apa/
cp doc/biblatex-apa* ~/texmf/doc/latex/biblatex-apa/

