#########
# build requirements:
# build-essential subversion
# cpan TAP::Harness::JUnit
#
SED = sed -r

ifeq ($(shell uname), Darwin)
  SED = sed -E
endif

MAJOR ?= 2
MINOR ?= 22
PATCH := $(shell svnversion -n . | $(SED) 's/^([0-9]+).*/\1/g')

all: manifest setup

setup:
	perl Build.PL
	./Build

test: setup
	TEST_AUTHOR=1 ./Build test

cover: manifest setup
	[ ! -d cover_db ] || rm -rf cover_db
	HARNESS_PERL_SWITCHES=-MDevel::Cover prove -Ilib t -MDevel::Cover
	cover -ignore_re t/

manifest: clean
	touch MANIFEST
	rm MANIFEST
	make setup
	./Build manifest

clean:
	touch Build
	rm -rf Build _build blib cover_db *META* tmp *gz *deb basecalls_rat*fasta

dist:	setup
	./Build dist
