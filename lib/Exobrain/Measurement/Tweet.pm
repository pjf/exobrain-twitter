package Exobrain::Measurement::Tweet;

use 5.010;
use autodie;
use Moose;
use Method::Signatures;

# ABSTRACT: Tweet measurement packet
# VERSION

# Declare that we will have a summary attribute. This is to make
# our roles happy.
sub summary;

# This needs to happen at begin time so it can add the 'payload'
# keyword.
BEGIN { with 'Exobrain::Measurement::Social'; }

=head1 DESCRIPTION

A tweet we may or may not care about.

Requires everything from Measurement::Social

=cut

has summary => (
    isa => 'Str', builder => '_build_summary', lazy => 1, is => 'ro'
);

method _build_summary() {
    return '@' . $self->from . " : " . $self->text;
}

1;
