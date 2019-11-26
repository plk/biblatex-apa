#!/bin/bash

mkdir biblatex-apa6
find -E . -regex '.*\.(bbx|cbx|dbx|lbx|pdf|tex|bib)' | xargs -J % cp % biblatex-apa6/
cp README biblatex-apa6/
\rm biblatex-apa6/reference.pdf
tar zcf biblatex-apa6.tgz biblatex-apa6
\rm -rf biblatex-apa6
