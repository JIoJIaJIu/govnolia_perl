use HTTP::Server::PSGI;
use Log::Any qw($log);
use Log::Any::Adapter ('Stdout');
use Plack::Builder;

use Govnolia::Config qw($host, $port, $log_level);
use Govnolia::Router;

my $router = Govnolia::Router->new();

my $app = sub {
    my $env = shift;
    $log->debug("Request $env");
    return $router->match($env);
};


my $server = HTTP::Server::PSGI->new(
    host => $Govnolia::Config::host,
    port => $Govnolia::Config::port
);

$log->debug("Server is started $Govnolia::Config::host:$Govnolia::Config::port");
$server->run($app);
