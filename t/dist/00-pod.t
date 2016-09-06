# -*- mode: cperl; tab-width: 8; indent-tabs-mode: nil; basic-offset: 2 -*-
# vim:ts=8:sw=2:et:sta:sts=2
#########
# Author: rmp
#
use strict;
use warnings;
use Test::More;

our $VERSION = q[1.0.0];

eval {
  require Test::Pod;
  Test::Pod->import();
};

plan skip_all => "Test::Pod 1.00 required for testing POD" if $@;
all_pod_files_ok();

