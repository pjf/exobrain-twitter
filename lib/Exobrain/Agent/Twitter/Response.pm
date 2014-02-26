package Exobrain::Agent::Twitter::Response;
use Moose;
use Method::Signatures;

# VERSION
# ABSTRACT: Spots respones bound for twitter, and sends them

with 'Exobrain::Agent::Twitter';
with 'Exobrain::Agent::Run';

method run() {
    # Watches for twitter responses, and translates them.

    $self->exobrain->watch_loop(
        class  => 'Intent::Response',
        filter => sub { $_->platform eq $self->component },
        then => sub {
            my $event = shift;
            my $text  = '@' . $event->to . ': ' . $event->text;
            $event->exobrain->intent('Tweet',
                to             => $event->from,
                in_response_to => $event->in_response_to,
                tweet          => $text,
                # TODO - Handle a DM (private) flag if passed
            );
        },
    );
}

1;
