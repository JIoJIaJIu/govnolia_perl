package Govnolia::Controllers::404;

use strict;
use warnings;

sub response {
    return [404, [], ['not found']];
}

1;
