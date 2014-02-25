package Exobrain::Intent::Tweet;

use v5.10.0;

use Moose;
use Method::Signatures;
use Exobrain::Types::Twitter qw( TweetStr );

# ABSTRACT: Intent message for twitter
# VERSION

method summary() { return $self->tweet; }

BEGIN { with 'Exobrain::Intent'; }

payload tweet => ( isa => TweetStr );

1;
