use strict;
use warnings;

# This is going to compare line by line and return the updated lines
sub compare_line {
	my ($primary_file_path, $secondary_file_path) = @_;
	# print($primary_file_path);
	open primary_file, $primary_file_path or die "Can not open $primary_file_path";
	my %diff = ();
	my @different = ();
	my @same = ();
	# Going through every line and adding it to the diff hashmap
	my $line_number = 0;
	while (my $result = <primary_file>) {
		$diff{$result} = $line_number++;
	}
	close(primary_file);
	open secondary_file, $secondary_file_path or die "Can not open $secondary_file_path";
	$line_number = 0;
	while (my $result = <secondary_file>) {
		$line_number++;
		if (exists $diff{$result}) {
			push(@same, $diff{$result} . " " x 5 . $result);
		} else {
			push(@different, $line_number . " " x 5 . $result);
		}
	}
	close(secondary_file);
	print("Here is what the same lines are between $primary_file_path and $secondary_file_path \n");
	for my $s (@same) {
		print($s . "\n");	
	}

	print("Here is what is different in $secondary_file_path from $primary_file_path \n");
	for my $d (@different) {
		print($d . "\n");
	}

}

1;