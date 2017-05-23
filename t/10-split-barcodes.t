#!/usr/bin/env perl
#########
# -*- mode: cperl; tab-width: 8; indent-tabs-mode: nil; basic-offset: 2 -*-
# vim:ts=8:sw=2:et:sta:sts=2
#
# Copyright (c) 2014 Oxford Nanopore Technologies Ltd.
#
# Author: dturner
#
use strict;
use warnings;
use Test::More tests => 1;
use IO::Capture::Stdout;

our $VERSION = q[1.0.0];

{
  local @ARGV = qw(t/data/basecalls_rat.fa);

  my $cap = IO::Capture::Stdout->new;
  $cap->start;

  eval {
    require("bin/split_barcodes.pl");
  };

  $cap->stop;

  my $output = { map { split /\s+/smix, } grep { /BC/smix } $cap->read() };
  use Data::Dumper; diag Dumper($output);
  is_deeply($output,
	    {
	     'BC04' => '764',
	     'BC07' => '1',
	     'BC09' => '1',
	     'BC10' => '442',
	     'BC11' => '1',
	     'BC12' => '1',
	    }, 'correct barcode output');
}
