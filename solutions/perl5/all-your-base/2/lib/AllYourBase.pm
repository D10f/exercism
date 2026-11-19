package AllYourBase;

use v5.42;
use List::Util qw{ any };

use Exporter qw<import>;
our @EXPORT_OK = qw<rebase>;

my @errors = (
    'input base must be >= 2',
    'output base must be >= 2',
    'all digits must satisfy 0 <= d < input base',
);

sub rebase ($digits, $input_base, $output_base)
{
    die $errors[0] if $input_base  < 2;
    die $errors[1] if $output_base < 2;
    die $errors[2] if any { $_ < 0 or $_ >=  $input_base } @$digits;

    # 1. Rebase to base 10
    my $exponent = @$digits - 1;
    my $base_ten = 0;

    foreach my $digit ( @$digits ) {
        $base_ten += $digit * ($input_base ** $exponent);
        $exponent -= 1;
    }

    # 2. Rebase to $output_base
    my $quotient = $base_ten;
    my @result   = ();

    do {
        my $remainder = $quotient % $output_base;
        $quotient = int($quotient / $output_base);
        unshift @result, $remainder;
    } while ( $quotient > 0 );

    return \@result;
}

1;
