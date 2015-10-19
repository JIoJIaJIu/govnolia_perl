package Govnolia::Template;

use strict;
use warnings;

use Mason;

use Govnolia::Config;

my $mason = Mason->new(
    comp_root => $Govnolia::Config::template_root,
);

sub render {
    return $mason->run($_[0])->output; 
}
