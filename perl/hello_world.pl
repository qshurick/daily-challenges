#!/usr/bin/perl
use strict;
use warnings;

sub count_div {
    my ($html, $current, $in_tag) = @_;

    my $next_open = index($html, "<div>", $current);
    my $next_close = index($html, "</div>", $current);

    if ($next_open == -1 && $in_tag == 0) {
        print "no open tags found\n";
        return 0;
    } elsif ($next_close == -1 && $in_tag > 0) {
        print "no close tag found\n";
        return 0;
    } elsif ($in_tag == 0 && ($next_close == -1 || $next_open < $next_close)) {
        print "found open tag\n";
        return count_div($html, $next_open + 5, 1);
    } elsif ($in_tag > 0 && ($next_open == -1 || $next_open > $next_close)) {
        print "found close tag\n";
        return 1 + count_div($html, $next_close + 6, $in_tag - 1);
    } elsif ($in_tag > 0 && $next_close != -1 && $next_open < $next_close) {
        print "found nested open tag\n";
        return count_div($html, $next_open + 5, $in_tag + 1);
    }

    print $next_open . "::" . $next_close . "::" . $in_tag . "::" . $current . "\n";
    return 0;
}

print count_div ("<div>Hello.</div><div>My name is <b>George</b>.</div>", 0, 0);
print "\n";
print count_div "<div><h1>The Word for Today</h1><div>aardvark</div></div>", 0, 0;
print "\n";
print count_div "<div></div>", 0, 0;
print "\n";
