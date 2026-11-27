package BinarySearch;

use v5.42;

use POSIX qw<floor>;

use Exporter qw<import>;
our @EXPORT_OK = qw<binary_search>;

sub binary_search ( $array, $value, $index = 0 ) {
    my $length = @$array;
    my $mid_point = floor($length / 2);
    my $mid_value = $array->[$mid_point];
    my @slice;

    die 'value not in array' if $length == 0;
    die 'value not in array' if $length == 1 && $array->[0] != $value;

    return $index + $mid_point if $mid_value == $value;

    if ($mid_value > $value) {
        @slice = splice @$array, 0, $mid_point;
    } else {
        @slice = splice @$array, $mid_point;
        $index = $index + $mid_point;
    }

    return binary_search(\@slice, $value, $index);
}


1;
