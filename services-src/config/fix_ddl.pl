#!/usr/bin/perl

foreach $file (@ARGV) {
	process($file, 'fh00');
}

sub process {
	
	unless (open($input, $file)) {
		print STDERR "Can't open $file: $!\n";
		return;
	}
	while ($line = <$input>) {              # note use of indirection

		#@tokens = split(' ', $line);
		$line =~ s/GO$/;/;
		$line =~ s/^DROP TABLE/DROP TABLE IF EXISTS/;
		$line =~ s/^(ALTER TABLE .+ FOREIGN KEY .+)$/\/\/$1/;
		print $line;
		
	}
}

