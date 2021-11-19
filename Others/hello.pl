#!/usr/bin/env perl
use strict;

sub run{
  my $a = prompt 'What is your name?: ';
  print "Hello ", $a, "!\n";
}

run();
