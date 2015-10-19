package Govnolia::Router;

use strict;
use warnings;

use Log::Any qw($log);
use Module::Load;
use Router::Simple;

use Govnolia::Controllers::404;

my %controllers = (
    "/" =>  {name => 'Root'},
    "/login" => {name => 'Login'},
    "/logout" => {name => 'Logout'},
);

sub new {
    my $cls = shift;
    my $self = {
        router => Router::Simple->new(),
    };
    bless($self, $cls);

    for my $path (keys %controllers) {
        $log->debug("New route $path");
        $self->{'router'}->connect($path, $controllers{$path});
    };

    return ($self);
}

sub match {
    my $self = shift;
    my $env = shift;
    
    if (my $controller = $self->{'router'}->match($env)) {
        my $module = "Govnolia::Controllers::$controller->{'name'}";
        $log->debug("Founded controller $module");
        load $module;
        return $module->response($env); 
    }

    return Govnolia::Controllers::404::response($env);
}

1;
