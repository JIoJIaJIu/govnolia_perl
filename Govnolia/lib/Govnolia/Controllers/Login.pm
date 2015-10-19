package Govnolia::Controllers::Login;

use strict;
use warnings;

use Govnolia::Middlewares::Auth;
use Govnolia::Template;

sub response {
    return [200, [], [Govnolia::Template::render('/login')]];
}

*response = Govnolia::Middlewares::Auth::decorate \&response;

1;
