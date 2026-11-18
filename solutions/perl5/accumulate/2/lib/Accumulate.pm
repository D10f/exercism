package Accumulate;

use v5.42;

use Exporter qw<import>;
our @EXPORT_OK = qw<accumulate>;

sub accumulate ( $list, $func ) {
    my @result = ();
    foreach my $element ( @$list ) {
        push @result, &$func($element);
    }
    return \@result;
}

1;
