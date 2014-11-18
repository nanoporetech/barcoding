# -*- mode: cperl; tab-width: 8; indent-tabs-mode: nil; basic-offset: 2 -*-
# vim:ts=8:sw=2:et:sta:sts=2
#########
# Author:        rmp
# Last Modified: $Date$
# Id:            $Id$
# $HeadURL$
#
use strict;
use warnings;
use Test::More;

eval "use Test::Pod::Coverage 1.00";

plan skip_all => "Test::Pod::Coverage 1.00 required for testing POD coverage" if $@;

all_pod_coverage_ok();
