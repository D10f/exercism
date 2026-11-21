package AllYourBase;

use v5.42;

use Exporter qw<import>;
our @EXPORT_OK = qw<rebase>;

my @errors = (
    'input base must be >= 2',
    'output base must be >= 2',
    'all digits must satisfy 0 <= d < input base',
);

sub rebase_from_base_ten ( $number, $output_base )
{
    my $quotient  = $number;
    my @remainder = ();

    do {
        my $r = $quotient % $output_base;
        $quotient = int($quotient / $output_base);
        unshift @remainder, $r;
    } while ( $quotient > 0 );

    return \@remainder;
}

sub rebase ($digits, $input_base, $output_base)
{
    die $errors[0] if $input_base < 2;
    die $errors[1] if $output_base < 2;

    my $exponent = @$digits - 1;
    my $sum = 0;

    foreach my $digit ( @$digits ) {
        die $errors[2] if $digit < 0 || $digit >= $input_base;
        $sum += $digit * ($input_base ** $exponent);
        $exponent -= 1;
    }

    return rebase_from_base_ten( $sum, $output_base );
}


1;
