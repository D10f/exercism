package ArmstrongNumbers;

use v5.42;

use Exporter qw<import>;
our @EXPORT_OK = qw<is_armstrong_number>;

sub get_digits( $number )
{
    my @digits = ();
    my $quotient = $number;
    my $remainder = 0;

    do {
        $remainder = $quotient % 10;
        $quotient = $quotient / 10;
        push @digits, $remainder;
    } while ($quotient >= 1);
 
    return \@digits, scalar @digits;
}

sub is_armstrong_number ($number) {
    my ($digits, $length) = get_digits($number);
    my $result = 0;

    foreach my $digit (@$digits) {
        $result += int($digit) ** $length;
    }

    return $result == $number;
}

1;