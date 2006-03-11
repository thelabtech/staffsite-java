#!/usr/bin/perl

foreach $file (@ARGV) {
	process($file, 'fh00');
}

sub process {
	
	unless (open($input, $file)) {
		print STDERR "Can't open $file: $!\n";
		return;
	}
	print "***********************************************************************************************\n";
	print "Processing $file\n";
	print "***********************************************************************************************\n";
	while ($line = <$input>) {              # note use of indirection

		#@tokens = split(' ', $line);
		#print $line;
		#	private String eventCustomAnswerID = "";
		
		
		@tokens = split(' ', $line);
		#if($line=~m/private\b(.+)\b(.+)(;| )/) {
		if(@tokens[0]=~m/private/) {
			$type=@tokens[1];
			$var=@tokens[2];
			if(substr($var,-1)=~m/;/){ $var=substr($var,0,length($var)-1);}
			print "public ", $type ," get", ucfirst($var), "() {\n\t return this.", $var, ";\n}\n";
			print "public void set", ucfirst($var), "(", $type, " ", $var, ") {\n\t this.", $var, "=",$var,";\n}\n";
		}

	
	}
}

