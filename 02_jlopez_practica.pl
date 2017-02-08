#!/usr/bin/perl
use strict;
use 5.014;
use Data::Dumper;
use warnings;

#López Tovar José Carlos

=pod

=head1 PRACTICA

Programa en Perl que lea un archivo y por medio de expresiones regulares busque los siguientes patrones, IP, URL, DN y MAILS.

=cut

#Con esto obtenemos el nombre del archivo ingresado
my $file = $ARGV[0];

#Variables necesarias para el programa
my %hash_ip;
my $ip;
my $total_ip;

my %hash_mail;
my $mail;
my $total_mail;

my %hash_dn;
my $dn;
my $total_dn;

my %hash_url;
my $url;
my $total_url;

#Si no se compila adecuadamente manda un mensaje
if (not defined $file)
{
	print "Compila el programa de manera correcta, por favor \n";
}
else
{
	#Si todo sale correcto iniciara el analisis del archivo
	if (-e $file)
	{
		open(ARCHIVO, '<', $file);
		print "Se esta llevando a cabo el analisis del archivo '$file', esto puede tardar unos 20 segundos, se paciente.\n";

		while(<ARCHIVO>)
		{	
			chomp;


			if ($_ =~/\b(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\b/)			
			{
				$ip = ($&)[0];
				$hash_ip{$ip}++;
				$total_ip++;
			}

			if ($_ =~ /([a-zA-Z0-9-]+)([a-zA-Z0-9-]+)@([a-zA-Z0-9-]+)[.]*([a-zA-Z0-9-]*)[.]*([a-zA-Z0-9-]*)/)
			{
			 	$mail = ($&)[0];
			    	$hash_mail{$mail}++;
			    	$total_mail++;
			}

			if ($_ =~/^([a-zA-Z0-9]([a-zA-Z0-9\-]{0,61}[a-zA-Z0-9])?\.)+[a-zA-Z]{2,6}$/) 
			{
			 	$dn = ($&)[0];
			 	$hash_dn{$dn}++;
			 	$total_dn++;
			}

			if ($_ =~/^(ht|f)tp(s?)\:\/\/[0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*(:(0-9)*)*(\/?)( [a-zA-Z0-9\-\.\?\,\'\/\\\+&%\$#_]*)?$/)
			{
			  	$url = ($&)[0];
			  	$hash_url{$url}++;
			  	$total_url++;
			}
		}
#--------------------------------------------------------------------------------------
#IMPRIME LAS IPS
		print "Total de ips: '$total_ip'\n";
		print "Total de ips distintas: ",scalar(keys %hash_ip),"\n";


#--------------------------------------------------------------------------------------
#IMPRIME LOS MAILS
		print "Total de mails: '$total_mail'\n";
		print "Total de mails distintos: ",scalar(keys %hash_mail),"\n";

#--------------------------------------------------------------------------------------
#IMPRIME EL TOTAL DE DOMAIN NAME
		print "Total de domain name: '$total_dn'\n";
		print "Total de domain name distintos: ",scalar(keys %hash_dn),"\n";

#--------------------------------------------------------------------------------------
#IMPRIME EL TOTAL DE URL
		print "Total de urls: '$total_url'\n";
		print "Total de urls distintos: ",scalar(keys %hash_url),"\n";
	} 
	else
	{
		print "No se encontro el archivo '$file'\n";
	}
	
}
close ARCHIVO;
