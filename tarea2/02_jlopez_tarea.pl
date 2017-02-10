#Lopez Tovar Jose Carlos
#Tarea 2

#ARCHIVO PASSWD

#!/usr/bin/perl -w

=pod

La forma de utilizar el programa es:

perl 02_jlopez_tarea.pl y poner el archivo passwd o como le hayamos puesto

=cut

use HTML::Template;
use warnings;
use strict;

my %hash;
my $output;
my $filename = $ARGV[0];
my @contador = ();

open PASSWD, "<" , $filename;
my $template = HTML::Template->new(filename => 'template.tmpl');
my @archivo = (<PASSWD>);

open PASSWD,">" , "test.html" or die "Error";
print PASSWD &test();
print "Content-Type: text/html\n\n", $template->output;

sub archivo()
{
	for (@archivo)
	{
		my %hash;
		if(m{(.*):(.*):(.*):(.*):(.*):(.*):(.*)})
		{
			$hash{"usuario"}=$1;
			$hash{"datos"}=$2.":".$3.":".$4.":".$5.":".$6.":".$7;
		}
		push(@contador, \%hash);
	}
	$template->param(THIS_LOOP => \@contador);
	$output.=$template->output();
}

close FILE;
