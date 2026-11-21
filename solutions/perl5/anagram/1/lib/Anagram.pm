package Anagram;

use v5.42;

use Exporter qw<import>;
our @EXPORT_OK = qw<match_anagrams>;

sub is_anagram ( $subject, $candidate )
{
    my $a = lc $subject;
    my $b = lc $candidate;
    
    return false if $a eq $b;

    my $sorted_a = join '', sort split '', $a;
    my $sorted_b = join '', sort split '', $b;
    
    return $sorted_a eq $sorted_b;
}


sub match_anagrams ( $subject, $candidates )
{
    my @result = grep { is_anagram($subject, $_) } @$candidates;
    return \@result;
}


1;
