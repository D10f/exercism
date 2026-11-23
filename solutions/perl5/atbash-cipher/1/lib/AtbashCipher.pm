package AtbashCipher;

use v5.42;

use Exporter qw<import>;
our @EXPORT_OK = qw<encode_atbash decode_atbash>;

sub rotate_letter ($letter)
{
    my $min = ord('a');
    my $max = ord('z');
    return $letter if ord($letter) < $min;
    
    my $distance = ord($letter) - $min;
    return chr((($max - $distance + 25) % $max) + $min);
}

sub normalize_text ($text)
{
    return $text =~ tr/A-Z/a-z/r =~ s/[^a-z0-9]+//gir;
}

sub encode_atbash ($phrase)
{
    my $normalized = normalize_text($phrase);
    my $ciphertext = '';
    my $i = 0;

    foreach my $letter (split '', $normalized) {
        $ciphertext .= rotate_letter($letter);
        $ciphertext .= ' ' if ($i + 1) % 5 == 0;
        $i += 1;
    }

    local $/ = ' ';
    chomp $ciphertext;
    return $ciphertext;
}

sub decode_atbash ($phrase)
{
    return join '', map { rotate_letter($_) } split '', normalize_text($phrase);
}

1;
