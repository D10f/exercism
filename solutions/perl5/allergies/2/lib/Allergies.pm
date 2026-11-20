package Allergies;

use v5.42;

use List::Util qw( first );

use Exporter qw<import>;
our @EXPORT_OK = qw<allergic_to list_allergies>;

my @allergies = qw(
    eggs
    peanuts
    shellfish
    strawberries
    tomatoes
    chocolate
    pollen
    cats
);

sub allergic_to ( $item, $score )
{
    my $index = first { $allergies[$_] eq $item } 0 .. $#allergies;
    my $index_bit = 2 ** $index;
    return ($score & $index_bit) > 0;
}

sub list_allergies ($score)
{
    my @result = grep { $_ if allergic_to($_, $score) } @allergies;
    return \@result;
}

1;
