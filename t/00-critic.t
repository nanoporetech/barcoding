# -*- mode: cperl; tab-width: 8; indent-tabs-mode: nil; basic-offset: 2 -*-
# vim:ts=8:sw=2:et:sta:sts=2
#########
# Author:        rmp
# Last Modified: $Date: 2014-01-22 10:42:15 +0000 (Wed, 22 Jan 2014) $
# Id:            $Id: 00-critic.t 32328 2014-01-22 10:42:15Z rpettett $
# $HeadURL: https://svn.oxfordnanolabs.local/sawtooth/trunk/t/00-critic.t $
#
package critic;
use strict;
use warnings;
use Test::More;
use English qw(-no_match_vars);

our $VERSION = do { my @r = (q$Revision: 32328 $ =~ /\d+/smxg); sprintf '%d.'.'%03d' x $#r, @r };

if ( not $ENV{TEST_AUTHOR} ) {
  my $msg = 'Author test.  Set $ENV{TEST_AUTHOR} to a true value to run.';
  plan( skip_all => $msg );
}

eval {
  require Test::Perl::Critic;
};

if($EVAL_ERROR) {
  plan skip_all => 'Test::Perl::Critic not installed';

} else {
  Test::Perl::Critic->import(
			     -severity => 1,
			     -exclude  => [qw(CodeLayout::RequireTidyCode
					      NamingConventions::Capitalization
					      PodSpelling
					      ValuesAndExpressions::RequireConstantVersion)],
			    );
  all_critic_ok(qw(lib scripts bin));
}

1;
