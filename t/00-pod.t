# -*- mode: cperl; tab-width: 8; indent-tabs-mode: nil; basic-offset: 2 -*-
# vim:ts=8:sw=2:et:sta:sts=2
#########
# Author:        rmp
# Last Modified: $Date: 2014-01-22 10:42:15 +0000 (Wed, 22 Jan 2014) $
# Id:            $Id: 00-pod.t 32328 2014-01-22 10:42:15Z rpettett $
# $HeadURL: https://svn.oxfordnanolabs.local/sawtooth/trunk/t/00-pod.t $
#
use strict;
use warnings;
use Test::More;

eval {
  require Test::Pod;
  Test::Pod->import();
};

plan skip_all => "Test::Pod 1.00 required for testing POD" if $@;
all_pod_files_ok();

