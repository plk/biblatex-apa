#!/bin/bash

mkdir biblatex-apa
find -E . -regex '.*\.(bbx|cbx|dbx|lbx|pdf|tex|bib)' | xargs -J % cp % biblatex-apa/
cp README biblatex-apa/
\rm biblatex-apa/reference.pdf
# Ignore apa6 docs, if present
\rm -f biblatex-apa6/biblatex-apa6.pdf
\rm -f biblatex-apa6/biblatex-apa6-test.pdf

tar zcf biblatex-apa.tgz biblatex-apa
\rm -rf biblatex-apa
