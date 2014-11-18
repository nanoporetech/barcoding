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
use Module::Build;
use Carp;
use English qw(-no_match_vars);

my $class = Module::Build->subclass(
                                    class => 'Module::Build::Barcoding',
                                    code  => <<'SUBCLASS' );
sub run_tap_harness {
  my ($self, $tests) = @_;

  require TAP::Harness::JUnit;

  # TODO allow the test @INC to be set via our API?

  my $aggregate = TAP::Harness::JUnit->new({
    lib => [@INC],
    verbosity => $self->{properties}{verbose},
    switches  => [ $self->harness_switches ],
    %{ $self->tap_harness_args },
  })->runtests(@$tests);

  return $aggregate;
}

SUBCLASS

my $builder = $class->new(
                          module_name         => 'barcoding',
                          dist_author         => 'Dan Turner <dan.turner@nanoporetech.com>',
                          dist_version        => do { my ($r) = q$Revision: 42050 $ =~ /(\d+)/smx; $r; },
                          dist_abstract       => q[Barcoding for Amplicons],
                          license             => 'gpl',
                          requires            => {
                                                  'strict'                  => '1.03',
                                                  'warnings'                => '1.05',
                                                  'Bio::Perl'               => '1.006922',
                                                  'Carp'                    => '1.04',
                                                  'English'                 => '1.02',
                                                  'Getopt::Long'            => '2.35',
                                                  'Readonly'                => '1.03',
                                                  'Text::LevenshteinXS' => '0.03',
                                                 },
                          recommends          => {
                                                 },
                          configure_requires  => {
                                                  'Module::Build' => 0.38,
                                                 },
                          build_requires      => {
                                                  'Test::More'              => '0.62',
                                                  'TAP::Harness::JUnit'     => '0.41',
                                                 },
                          build_recommends    => {
                                                  'Test::Distribution'      => '2.00',
                                                  'Test::Perl::Critic'      => '1.01',
                                                 },
                          script_files        => [qw(bin/split_barcodes)],
#                          sign                => 1,
                          use_tap_harness     => 1,
                          tap_harness_args    => {
                                                  jobs      => 10,
                                                  verbosity => 1,
                                                  merge     => 1,
                                                  xmlfile   => 'tap-harness-junit.xml',
                                                 },
                         );

$builder->create_build_script();
