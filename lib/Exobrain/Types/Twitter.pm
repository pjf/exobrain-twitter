package Exobrain::Types::Twitter;
use strict;
use warnings;

# ABSTRACT: Exobrain types for use in Twitter communications
# VERSION

use MooseX::Types -declare => [qw(
    TweetStr
)];

use MooseX::Types::Moose qw(Str);

subtype TweetStr,
    as Str,
    where { length($_) <= 140 }
;

1;
