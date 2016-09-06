MAJOR ?= 1
MINOR ?= 0
SUB   ?= 0
PATCH ?= 0

all: manifest setup

setup:
	perl Build.PL
	./Build

test: setup
	TEST_AUTHOR=1 ./Build test

cover: manifest setup
	./Build testcover

versions:
	find Build.PL bin t -type f -exec perl -i -pe 's/VERSION\s+=\s+q[[\d.]+]/VERSION = q[$(MAJOR).$(MINOR).$(SUB)]/g' {} \;

manifest: clean
	touch MANIFEST
	rm MANIFEST
	make setup
	./Build manifest

clean:
	touch Build
	rm -rf Build _build blib cover_db *META* tmp *gz *deb basecalls_rat*fasta MANIFEST.SKIP.bak tap-harness-junit.xml

dist:	setup
	./Build dist
