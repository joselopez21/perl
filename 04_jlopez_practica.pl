
#PRACTICA 4

#López Tovar José Carlos

my $cmd;
my @res=();
my %HoF = (                           # Compose a hash of functions
    salir   =>  sub { 
			for (@res)
                {
                  print "Resultado: ", $_;
                }
                      
                  exit
                },
    suma    =>  \&suma,
    resta   =>  \&resta,
    multi   =>  \&multi,
    divi    =>  \&divi,
    mod     =>  sub{ 
                  my $a=shift;
                  my $b=shift;
                  push @res, $a%$b; 
                   },
    help    =>  sub{ print "la opciones son la siguientes:\nsuma\nresta\nmulti\ndivi\nmod\nsalir\n"},
);
while(1){

 $cmd=<STDIN>;
 @op = split " " ,$cmd;
 
   if($HoF{lc $op[0]}){
    
    $HoF{lc $op[0]}->($op[1],$op[2]);
   }
   else {
    warn "Unknown command: `$cmd'; Try `help' next time\n";
   }
}

sub suma{
   my $a=shift;
   my $b=shift;
   push @res, $a+$b;
   }
sub resta{
   my $a=shift;
   my $b=shift;
   push @res, $a-$b;
}
sub multi{
   my $a=shift;
   my $b=shift;
   push @res, $a*$b;
}
sub divi{
  my $a=shift;
  my $b=shift;
  if($b != 0){
      push @res, $a/$b;
  }
  else {
    print "No se puede hacer la division entre 0";
  }

}