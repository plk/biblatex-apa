#!/opt/homebrew/bin/perl

use Test::More;
use Test::Deep;
use CAM::PDF;

cmp_pdf('doc/biblatex-apa-test.pdf', 'doc/reference.pdf');
done_testing;


sub cmp_pdf ($$) {
  my ($got, $expected) = @_;
  $got = CAM::PDF->new($got) or die "Could not create CAM::PDF instance with : $got";
  $expected = CAM::PDF->new($expected) or die "Could not create CAM::PDF instance with : $expected";

  foreach my $page_num (1 .. $expected->numPages()) {
    my $tree1 = $got->getPageContentTree($page_num, "verbose");
    my $tree2 = $expected->getPageContentTree($page_num, "verbose");
    cmp_deeply($tree1->{blocks}, $tree2->{blocks}, "Page $page_num");
  }
}
