package LanguageList;

use v5.40;

our @Languages;

sub add_language ($language) {
    return push @Languages, $language;
}

sub remove_language () {
    return pop @Languages;
}

sub first_language () {
    return $Languages[0];
}

sub last_language () {
    return $Languages[-1];
}

sub get_languages (@elements) {
    my @indices = grep { defined $Languages[$_ - 1] } @elements;
    return map { @Languages[$_ - 1] } @indices;
}

sub has_language ($language) {
    foreach my $lang (@Languages) {
        return 1 if $lang eq $language;
    }
    return 0;
}

1;
