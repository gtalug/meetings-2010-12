#! /bin/perl

=pod

    smackdown

    Sample program to demonstrate Perl concepts

=cut

use strict;
use warnings;

print "Please enter filename to load: ";

my $file = <>;  # create scalar and load from STDIN

chomp $file;    # Remove new-line from input

open my $input, "<", $file or die "$!";

push my @lines, <$input>;   # Read contents of file into array

print "$file contained $. lines\n"; # Perl provides record count

close $input or die "$!";   # Close and check both optional

chomp @lines;   # Remove new-lines from entire input

my %table;      # Associative array, aka "hash"

foreach (@lines) {
    my ($fruit, $colour) = split /\s+/;
    print $colour . " | " . $fruit, "\n";
    $table{lc($fruit)} = $colour;
}

print keys %table, values %table, "\n";

print ask_stupid_question(\%table) . "\n";

exit 0;         # Processing stops here

sub ask_stupid_question {

    my ($hash_ref) = @_; 
    
    print keys %$hash_ref, values %$hash_ref, "\n";
    print "Name a fruit: "; my $in = <>;
    chomp $in; 
    if ($in =~ /sub/i) {
        print "That's a funny kind of fruit!\n";
    } 
    print "Entry unrecognised\n" unless ($$hash_ref{lc($in)});
    
   return $$hash_ref{lc($in)};
}
#   smackdown Ends
