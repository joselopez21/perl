#!perl
use warnings;
use strict;

#PRACTICA 1
#Un arreglo que contenga del 1 al 10 y el segundo tendra los pares del primero
#LOPEZ TOVAR JOSE CARLOS

my @a= (1..10);
my @b= ();

foreach(@a){

if (($_ % 2) ==0){
	push @b, $_;
	}
}

print @b;
