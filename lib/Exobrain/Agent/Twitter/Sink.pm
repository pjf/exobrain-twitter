package Exobrain::Agent::Twitter::Sink;
use Moose;

# VERSION
# ABSTRACT: Sink agent for exobrain/twitter

with 'Exobrain::Agent::Twitter';
with 'Exobrain::Agent::Run';

method run() {
    # Start by initialising our twitter object, so we fail
    # quickly if anything might go wrong there.

    $self->twitter;

    # Now watch for intents and process them.

    $exobrain->watch_loop(
        class => 'Intent::Tweet',
        then => sub {
            my $event = shift;
            $self->twitter->update($event->tweet);
        },
    );
}

1;
