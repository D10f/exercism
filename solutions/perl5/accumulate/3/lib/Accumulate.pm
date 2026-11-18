package Accumulate;

use v5.42;

use Exporter qw<import>;
our @EXPORT_OK = qw<accumulate>;

# This iteration shows an in-place mutation.
sub accumulate ( $list, $func ) {
    foreach my $element ( @$list ) {
       $element = $func->($element);
    }
    return $list;
}

1;
