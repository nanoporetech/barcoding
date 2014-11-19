barcoding
=========

This repository is part of the ONT Barcoding Protocol for amplicons.

Data
----
The dataset (in t/data/) was prepared with two barcodes for illustrative
purposes. We do not recommend that two barcodes are used generally.

Scripts
-------
Scripts can be found in the bin/ subdirectory.

Prerequisites
-------------
The main prerequisites are:
 - Bio::Perl
 - Text::LevenshteinXS
 - Readonly

All should be available from CPAN (UNIX/Strawberry systems: "cpan <modulename>") or PPD (for ActivePerl)

Testing
-------
make test
