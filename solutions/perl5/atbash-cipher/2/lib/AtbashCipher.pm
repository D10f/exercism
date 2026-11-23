package AtbashCipher;

use v5.42;

use Exporter qw<import>;
our @EXPORT_OK = qw<encode_atbash decode_atbash>;

sub encode_atbash ($phrase)
{
    return join ' ', $phrase =~ tr/A-Z/a-z/r =~ s/[^a-z0-9]+//gir
                             =~ tr/a-z/zyxwvutsrqponmlkjihgfedcba/r
                             =~ /.{1,5}/g;
}

sub decode_atbash ($phrase)
{
    return join ' ', $phrase =~ tr/A-Z/a-z/r =~ s/[^a-z0-9]+//gir
                             =~ tr/a-z/zyxwvutsrqponmlkjihgfedcba/r;
}


1;
