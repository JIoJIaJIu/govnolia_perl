# Plack::Middleware::Auth is not usefull cause it wraps $app
# but needed to wrap custom controllers
# That's why I create own middleware
package Govnolia::Middlewares::Auth;

use Log::Any qw($log);

sub decorate (&) {
    my $code = shift;
    
    return sub {
        $log->debug("is Authed?");
        return $code->();
    }
}

1;
