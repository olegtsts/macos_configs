#!/usr/bin/perl

use strict;
use warnings;

my $file_name = shift(@ARGV);
my $remote_execute = shift(@ARGV);

$file_name =~ s/\..*/\.tex/g;

unless ($file_name) {
	print_smth("File name undefined");
	exit_with_bell(1);
}

my $base_filename = substr($file_name, 0, -4);
my $res = execute_command("rm -rf $base_filename.dvi $base_filename.aux $base_filename.log");

if ($res) {
	print_smth("Deleting files failed");
	exit_with_bell(1);
}

foreach (1..2) {
	my $res = execute_command("/Library/TeX/texbin/pdflatex -interaction errorstopmode -halt-on-error $file_name || rm $base_filename.pdf");

	print_smth("");
	if ($res) {
		print_smth("pdflatex failed");
		exit_with_bell(1);
	}
}

$res = execute_command("rm -rf $base_filename.dvi $base_filename.aux $base_filename.log $base_filename.out $base_filename.toc");

if ($res) {
	print_smth("Deleting files failed");
	exit_with_bell(1);
}

$res = execute_command("open -a /Applications/Preview.app $base_filename.pdf || terminal-notifier -message \"TEX FAILED\" -reply");

exit_with_bell(1);

if ($res) {
	print_smth("Open result file failed\n");
	exit_with_bell(1);
}

sub exit_with_bell {
	print_smth("\a");
	exit(1);
}

sub execute_command {
	my $command = shift;
	if ($remote_execute) {
		system("screen -S tex -X stuff \$'cd " . `pwd` . "'");
		system("screen -S tex -X stuff \$'alias vi=./empty; $command\\n'")
		and die "system failed on '$command'";
	} else {
		system($command)
		and die "system failed on '$command'";
	}
}

sub print_smth {
	my $string = shift;

	if ($remote_execute) {
		system("screen -S tex -X stuff \$'echo \\'$string\\'\\n'")
	} else {
		print $string . "\n";
	}
}

