#!/usr/bin/perl -w
use Test::More tests => 6;

use strict;
no warnings 'once';
use Config;
use LWP::UserAgent;
use HTTP::Cookies;
use URI;

ok(1, "loaded");

my $perl = $Config{'perlpath'};
$perl = $^X if $^O eq 'VMS';

my $pid = open(DAEMON, "$perl ./apache.pl |");
die "Can't exec: $!" unless defined $pid;
sleep 3; # wait for the server to come up
ok(1, "should get server up ok");

my $port = 7500 + $<; # give every user a different port
my $hostname = 'localhost'; # hostname;
my $url = "http://$hostname:$port/";

my $ua = LWP::UserAgent->new(cookie_jar => HTTP::Cookies->new());
my $request = HTTP::Request->new('GET', $url);
my $response = $ua->request($request);
ok($response, "Should get response back for $url");
ok($response->is_success, "Should get successful response back");
print $response->error_as_HTML unless $response->is_success;
my $html = $response->content;
ok($html, "Should get some HTML back");

# Kill the OpenFrame::Server::HTTP servers
kill 2, $pid;
ok(1, "Should be able to kill the servers");
