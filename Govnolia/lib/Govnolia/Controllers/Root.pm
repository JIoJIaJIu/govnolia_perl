package Govnolia::Controllers::Root;

use strict;
use warnings;

use Govnolia::Template qw(render);

sub response {
    return [200, [], [Govnolia::Template::render('/index')]];
}

1;
