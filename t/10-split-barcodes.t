#!/usr/bin/env perl
#########
# -*- mode: cperl; tab-width: 8; indent-tabs-mode: nil; basic-offset: 2 -*-
# vim:ts=8:sw=2:et:sta:sts=2
#
# Copyright (c) 2014 Oxford Nanopore Technologies Ltd.
#
# Author:        dturner
# Last Modified: $Date$
# Id:            $Id$
# $HeadURL$
#
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

  is((scalar grep { /^[ACTG]+/smx } keys %{$output}), 10, 'correct number of discovered barcodes reported');

  ok($output->{GGTGCTGAAGCGTTGAAACCTTTGTCCTCTCTTAACCT} > 460, 'discovered barcode count');
  ok($output->{GGTGCTGTTCGGATTCTATCGTGTTTCCCTATTAACCT} > 790, 'discovered barcode count');
}
