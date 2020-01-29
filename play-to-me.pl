print "File prefix please: ";
my $prefix = <STDIN>;
chomp $prefix;
my $count = 1;
my $postfix = ".wav";
my $action;
while (1) {
  my $file = $prefix.".".$count.$postfix;
  print "$file\n";
  `play $file`;

  $action = <STDIN>;
  chomp $action;
  if ($action eq "n") {
    $count++;
  } elsif ($action eq "p") {
    $count = $count - 1;
  } elsif ($action eq "h") {
    print "n = next\n";
    print "r = repeat\n";
    print "p = previous\n";
    print "m = merge\n";
    print "h/? = help\n";
  } elsif ($action eq "r") {
     
  } elsif ($action eq "m") {
    print "How many files?\n";
    my $tot = <STDIN>;
    chomp $tot;
    my $command="sox ";
    my $idx=$tot;
    my $mnum = $count-$tot; 
    while( $idx ne 0 ) {
      $mnum++;
      $file = $prefix.".".$mnum.$postfix." ";
      $command=$command.$file;
      $idx--;
    }
    print "$command\n";
    
    $newfile=$prefix.".".$count;
    $idx=$tot;
    while ($idx ne 1){
      $idx--;
      $newfile=$newfile."M";
    }
    $newfile=$newfile.$postfix;

    $command=$command.$newfile;
    print "$command\n";
    `$command`;
    `play $newfile`;
    
  } else {
    print "$count IDK WHAT YOU WANT OK\n";
  }
}
