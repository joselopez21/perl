#!/usr/bin/perl -w
use warnings;
use strict;

#López Tovar José Carlos

#POD para documentacion a continuacion se muestra un ejemplo de su uso

=pod

=head1 TAREA 1

Programa sencillo que realiza la suma o multiplicacion dependiendo de la opcion que de el
usuario, de dos numeros.

=cut

print "Que opcion quieres realizar: \n";
print "1-> Suma\n";
print "2-> Multiplicacion\n";

my $opcion =<STDIN>;

print "Ingresa el primer valor: \n";
my $valor1= <STDIN>;

print "Ingresa el segundo valor: \n";
my $valor2=<STDIN>;

if($opcion == 1){
	print "El resultado de la suma es : ", $valor1+$valor2;
}
elsif ($opcion == 2){
	print "El resultado de la multiplicacion es : ", $valor1*$valor2;
} 


#PRAGMA

#Pragma son aquellos modulos que influyen en algun momento durante el tiempo en que se #compila o en tiempo de ejecucion, como por ejemplo los usados hoy en clase warnings y #strict
	






