#! /usr/bin/perl
@files = <*.c>;
foreach $file (@files) {
	print "$file\n";
	open F,"$file";
	open T,">>./new/$file";
	while ($line = <F>) {
		chomp $line;
		print "$line\n";
		if ($line =~ /port setting/) {
			print T "$line\n";
			print T "write_reg8(1,1);\n";
			print T "write_reg8(2,2);\n";
			print T "write_reg8(3,3);\n";
		}
		else {
			print T "$line\n";
		}
		}
	close F;
	close T;
}
