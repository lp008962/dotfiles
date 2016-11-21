#!/usr/bin/env perl
use strict;
use warnings;
use LWP::UserAgent;

###!/bin/sh
### How can I remove '^M' ?
##latest=`curl -sI https://github.com/peco/peco/releases/latest | awk -F'/' '/^Location:/{print $NF}'`
##wget - https://github.com/peco/peco/releases/download/$latest/peco_linux_amd64.tar.gz

my $uri = LWP::UserAgent->new->head('https://github.com/peco/peco/releases/latest')->request->uri;
my @version = split '/', $uri;

print $version[-1];

