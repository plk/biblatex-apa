#!/bin/bash

mkdir biblatex-apa6
find -E . -regex '.*\.(bbx|cbx|dbx|lbx|pdf|tex|bib)' | xargs -J % cp % biblatex-apa6/
cp README biblatex-apa6/
\rm biblatex-apa6/reference.pdf
# Ignore master apa7 docs, if present
\rm -f biblatex-apa6/biblatex-apa.pdf
\rm -f biblatex-apa6/biblatex-apa-test.pdf

tar zcf biblatex-apa6.tgz biblatex-apa6
\rm -rf biblatex-apa6
