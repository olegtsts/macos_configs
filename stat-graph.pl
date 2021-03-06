#!/usr/bin/perl

use strict;
use warnings;

my $hosts = [split(/,/, shift)];


my $targets = [];
foreach my $target_templates (
	["five_min.XXX.skyman.down.accepted"],
	["one_min.XXX.logcount_Rotate*.count"],
	["one_min.XXX.slavestat_yabs.behind_master"],
	["one_min.XXX.diskstat_util*.util"],
	["one_min.XXX.netstat_bytes*.*"],
	["one_min.XXX.meminfo.free", "one_min.XXX.meminfo.total"],
) {
	my $targets = [];
	foreach my $host (@$hosts) {
		$host =~ s/\./_/g;
		foreach my $target_template (@$target_templates) {
			my $target = $target_template;
			$target =~ s/XXX/$host/g;
			push(@$targets, $target);
		}
	}
	my $url = "https://bs-mg.yandex-team.ru/render/?width=586&height=308&_salt=1506602623.76&"
		. join('&', map {"target=$_"} @$targets) . "&from=-2h";
	system("open '$url'");
}
