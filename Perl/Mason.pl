foo.mc:
  % my $name = "Mason";
  Hello world! Welcome to <% $name %>.

#!/usr/local/bin/perl
use Mason;
my $mason = Mason->new(comp_root => '...');
print $mason->run('/foo')->output;



