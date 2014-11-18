# -*- mode: cperl; tab-width: 8; indent-tabs-mode: nil; basic-offset: 2 -*-
# vim:ts=8:sw=2:et:sta:sts=2
#########
# Author:        rmp
# Last Modified: $Date: 2014-11-15 00:27:13 +0000 (Sat, 15 Nov 2014) $
# Id:            $Id: 00-changes.t 44593 2014-11-15 00:27:13Z rpettett $
# $HeadURL: https://svn.oxfordnanolabs.local/metrichor/branches/prerelease-22.0/portal/t/00-changes.t $
#
package critic;
use strict;
use warnings;
use Test::More;
use English qw(-no_match_vars);

our $VERSION = do { my @r = (q$Revision: 44593 $ =~ /\d+/smxg); sprintf '%d.'.'%03d' x $#r, @r };

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
