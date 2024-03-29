# Copied from Andy Lester (http://use.perl.org/~petdance/journal/12391)
# This test validates the Pod in this module
#
# $Id: pod.t,v 1.2 2003/06/18 19:50:08 waltman Exp $

use Test::More;
use File::Spec;
use File::Find;
use strict;

eval "use Test::Pod 0.95";

if ($@) {
    plan skip_all => "Test::Pod v0.95 required for testing POD";
} else {
    Test::Pod->import;
    my @files;
    my $blib = File::Spec->catfile(qw(blib lib));
    find( sub {push @files, $File::Find::name if /\.p(l|m|od)$/}, $blib);
    plan tests => scalar @files;
    foreach my $file (@files) {
        pod_file_ok($file);
    }
}
