package Exobrain::Agent::Twitter::Sink;
use Moose;
use Method::Signatures;

# VERSION
# ABSTRACT: Sink agent for exobrain/twitter

with 'Exobrain::Agent::Twitter';
with 'Exobrain::Agent::Run';

method run() {
    # Start by initialising our twitter object, so we fail
    # quickly if anything might go wrong there.

    $self->twitter;

    # Now watch for intents and process them.

    $self->exobrain->watch_loop(
        class => 'Intent::Tweet',
        then => sub {
            my $event = shift;

            if (my $reply = $event->in_response_to) {
                $self->twitter->update({
                    status                => $event->tweet,
                    in_reply_to_status_id => $reply,
                });
            }
            else {
                $self->twitter->update($event->tweet);
            }
        },
    );
}

1;
