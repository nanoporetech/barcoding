use strict;
use warnings;
use Test::More tests => 3;
use IO::Capture::Stdout;

{
  local @ARGV = qw(t/data/basecalls_rat.fa);

  my $cap = IO::Capture::Stdout->new;
  $cap->start;

  eval {
    require("bin/split_barcodes");
  };

  $cap->stop;
  my $output = { map { split /\s+/smix, } $cap->read() };

  is(scalar keys %{$output}, 11, 'correct number of discovered barcodes reported');

  ok($output->{GGTGCTGAAGCGTTGAAACCTTTGTCCTCTCTTAACCT} > 400, 'discovered barcode count');
  ok($output->{GGTGCTGTTCGGATTCTATCGTGTTTCCCTATTAACCT} > 530, 'discovered barcode count');
}
