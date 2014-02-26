package Exobrain::Twitter;
use Moose;

# ABSTRACT: Twitter components for exobrain
# VERSION

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
