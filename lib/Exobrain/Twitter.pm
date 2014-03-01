package Exobrain::Twitter;
use Moose;

# ABSTRACT: Twitter components for exobrain
# VERSION

=head1 SYNOPSIS

    $ exobrain-twitter-auth

    $ ubic start exobrain.twitter

=head1 DESCRIPTION

This distribution provides Twitter access to L<Exobrain>. To enable,
please run the L<exobrain-twitter-auth> file, which will run you
through the setup proceess.

Once enabled, services can be controlled using C<ubic>. Try
C<ubic status> to see them, and C<ubic start exobrain.twitter> to
start the twitter framework.

=head1 PROVIDED CLASSES

This component provides the following agents:

=over

=item L<Exobrain::Agent::Twitter::Source>

=item L<Exobrain::Agent::Twitter::Sink>

=item L<Exobrain::Agent::Twitter::Response>

=back

It also provides L<Exobrain::Intent::Tweet> and
L<Exobrain::Measurement::Tweet> classes for sending and
receiving tweets, respectively.

=cut

with 'Exobrain::Component';

# This is the namespace everything will be installed in by default.
# It's automatically prepended with 'exobrain'

sub component { "twitter" };

# These are the services in that namespace. So we have
# 'exobrain.twitter.source' and 'exobrain.twitter.sink'.

sub services {
    return (
        source   => 'Twitter::Source',
        sink     => 'Twitter::Sink',
        response => 'Twitter::Response',
    )
}

1;

=for Pod::Coverage component services
