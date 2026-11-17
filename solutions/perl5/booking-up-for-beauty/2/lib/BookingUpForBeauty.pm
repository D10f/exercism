package BookingUpForBeauty;

use v5.40;
use Time::Piece;

use Exporter ('import');
our @EXPORT_OK = qw(
    appointment_has_passed
    is_afternoon_appointment
    describe_appointment
);

my $STRPTIME_FORMAT = '%Y-%m-%d' . 'T' . '%H:%M:%S';

sub _parse_datetime ($date_string) {
    return Time::Piece->strptime($date_string, $STRPTIME_FORMAT);
}

sub _between_hours ($time, $start, $end) {
    return $time->hour >= $start && $time->hour < $end;
}

sub appointment_has_passed ($date_string) {
    my $appointment = _parse_datetime($date_string);
    my $now = localtime;
    return $now > $appointment;
}

sub is_afternoon_appointment ($date_string) {
    my $appointment = _parse_datetime($date_string);
    return _between_hours($appointment, 12, 18);
}

sub describe_appointment ($date_string) {
    my $appointment = _parse_datetime($date_string);
    my $date = $appointment->strftime("%m/%d/%Y");
    my $time = $appointment->strftime("%l:%M %p") =~ s/^\s+//r;
    return sprintf('You have an appointment on %s %s', $date, $time);
}

1;
