use Plack::Builder;

use Govnolia::Router;

my $app = sub {
    my $env = shift;
    my $router = Govnolia::Router->new($env->{'psgix.logger'});
    return $router->match($env);
};

builder {
    enable "SimpleLogger", level => "debug";
    $app;
};
