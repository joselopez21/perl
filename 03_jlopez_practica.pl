#!/usr/bin/perl

#PRACTICA DE CLASE

#López Tovar José Carlos

use warnings;
use strict;
my $num1;
my $num2;
my $opc;

sub menu{
	print"Dame el primer numero: \n";
	$num1=<STDIN>;
	print"Dame el segundo numero: \n";
	$num2=<STDIN>;
	print "Que operacion hacer: 1.suma 2.resta 3.multiplicacion 4.division\n";
	chomp ($opc=<STDIN>);
	
	use Switch;
	switch( $opc )
	{
	case 1 {&suma();}
	case 2 {&resta;}
	case 3 {&multiplicacion;}
	case 4 {&division;}
	}

	}



sub suma{
	print $num1+$num2;
}

sub resta{
	print $num1-$num2;
	}

sub multiplicacion{
	print $num1*$num2;
	}

sub division{
	if ($num2 != 0)
	{
	print $num1/$num2;
	}
	else
	{
	print "Division entre cero (error)";
	}
}

&menu;

