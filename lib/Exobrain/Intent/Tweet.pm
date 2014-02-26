package Exobrain::Intent::Tweet;

use v5.10.0;

use Moose;
use Method::Signatures;
use Exobrain::Types::Twitter qw( TweetStr );

# ABSTRACT: Intent message for twitter
# VERSION

method summary() { return $self->tweet; }

BEGIN { with 'Exobrain::Intent'; }

payload tweet          => ( isa => TweetStr           );

# Actually this is an Int, but they get pretty large. Transmitting
# them as strings means we don't have to care about 32/64-bit issues.
payload in_response_to => ( isa => 'Str', required => 0 );

1;
