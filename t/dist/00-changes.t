# -*- mode: cperl; tab-width: 8; indent-tabs-mode: nil; basic-offset: 2 -*-
# vim:ts=8:sw=2:et:sta:sts=2
#########
# Author: rmp
#
package critic;
use strict;
use warnings;
use Test::More;
use English qw(-no_match_vars);

our $VERSION = q[1.0.0];

eval {
  require Test::CPAN::Changes;
  Test::CPAN::Changes->import();
};

if($EVAL_ERROR) {
  plan skip_all => 'Test::CPAN::Changes not installed';

} else {
  changes_ok();
}

1;
