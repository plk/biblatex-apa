#!/bin/bash

mkdir biblatex-apa
find -E . -regex '.*\.(bbx|cbx|dbx|lbx|pdf|tex|bib)' | xargs -J % cp % biblatex-apa/
cp README biblatex-apa/
\rm biblatex-apa/reference.pdf
tar zcf biblatex-apa.tgz biblatex-apa
\rm -rf biblatex-apa
