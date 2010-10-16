#!/opt/local/bin/perl

use Test::More tests => 1;
use Test::PDF;

cmp_pdf('reference.pdf', 'biblatex-apa-test.pdf', 'PDFs are identical');
