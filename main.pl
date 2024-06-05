use strict;
use warnings;
use doraediff;

my $primary_file = $ENV{PRIMARY};
my $secondary_file = $ENV{SECONDARY};
compare_line($primary_file, $secondary_file);