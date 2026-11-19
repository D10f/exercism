package Acronym;

use v5.42;

use Exporter qw<import>;
our @EXPORT_OK = qw<abbreviate>;

sub abbreviate ($phrase) {
    $phrase =~ s/[^A-Za-z0-9\s\-]+//g;
    my @words = split /[-\s]+/, $phrase;
    return join '', map { uc substr($_, 0, 1) } @words;
}

1;
