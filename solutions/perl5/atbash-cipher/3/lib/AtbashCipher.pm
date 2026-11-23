package AtbashCipher;

use v5.42;

use Exporter qw<import>;
our @EXPORT_OK = qw<encode_atbash decode_atbash>;

sub rotate_text ($text)
{
    return $text =~ tr/a-z/zyxwvutsrqponmlkjihgfedcba/r;
}

sub normalize_text ($text)
{
    return $text =~ tr/A-Z/a-z/r
                 =~ s/[^a-z0-9]+//gir;
}

sub encode_atbash ($phrase)
{
    my $ciphertext = rotate_text(normalize_text($phrase));
    return join ' ', $ciphertext =~ /.{1,5}/g;
}

sub decode_atbash ($phrase)
{
    return rotate_text(normalize_text($phrase));
}

1;
