package Anagram;

use v5.42;

use Exporter qw<import>;
our @EXPORT_OK = qw<match_anagrams>;

sub is_anagram ( $subject, $candidate )
{
    $subject = lc $subject;
    $candidate = lc $candidate;
    
    return false if $subject eq $candidate;

    my $sorted_subject = join '', sort split '', $subject;
    my $sorted_candidate = join '', sort split '', $candidate;
    
    return $sorted_subject eq $sorted_candidate;
}


sub match_anagrams ( $subject, $candidates )
{
    my @result = grep { is_anagram($subject, $_) } @$candidates;
    return \@result;
}


1;
