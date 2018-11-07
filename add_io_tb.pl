#! /usr/bin/perl
@files = <*.v>;
foreach $file (@files) {
	print "$file\n";
	open F,"$file";
	open T,">>./new/$file";
	while ($line = <F>) {
		chomp $line;
		print "$line\n";
		if ($line =~ /pkg\.SCLPAD/) {
			$line =~ s/SCLPAD/P60/;
		}
		elsif ($line =~ /pkg\.SDAPAD/) {
			$line =~ s/SDAPAD/P61/;
		}
			print T "$line\n";
		}
	close F;
	close T;
}
