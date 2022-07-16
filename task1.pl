#!/usr/bin/perl
use File::Copy; # Imported File::Copy in order to copy files from source to destination folder.

if($#ARGV!=3)   # Impelemented Error Handling to check, whether all the parameters are provided.
{
	die "Missing Parameters,please provide 4 parameters. \n";
}


my ($filename,$dir1,$dir2,$ip) = @ARGV;
my @file1;


# Assigned parameter to array.

if ( ! -d $dir2 ) # Implemented Error Handling to check and report if the destination folder is available.
{
	mkdir $dir2;
}
else{warn "Folder Already exists."}



open(FH, '<', $filename) or die $!;

#my $i=1;
while($line=<FH>)
{
	my @x = split(" ",$line); 			# Split the Line by empty space.
	@x[2] =~ s/[\p{Pi}\p{Pf}'"]//g; # Remove, all single quotation and apostrophes.
	@x[3]=~ s/^"|"$//g; 						# Remove, trailing quotation.
	if(@x[0] eq $ip)
	{
		if(@x[4] eq "200")
		{
			if(@x[2] eq "GET")
			{
				push(@file1, @x[3])				# Appending array with file paths which are
			}
		}
	}
}

foreach ( @file1 )
{
	my $source = "$dir1$_";
	my $target = "$dir2$_";
	if(-e $source)									#Check Whether source directory is available.
	{
		if(-e $dir2)									#Check Whether destination directory is available.
		{
			print("File Available for copying - $source \n");
			copy ($source, $target) or warn "Copy of $_ failed: $!";  # Copy files from source to destination.
		}
		else{ warn "Destination Folder not Available - $source"; }
	}
	else{ warn "Source Folder not Available - $source";}
}
