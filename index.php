<?php
require 'vendor/autoload.php';

use Monolog\Logger;
use Monolog\Handler\StreamHandler;

// Crie um logger
$log = new Logger('name');
$log->pushHandler(new StreamHandler('app.log', Logger::WARNING));

// Adicione registros de log
$log->warning('Foo');
$log->error('Bar');

echo "Logs foram gerados no arquivo app.log";
?>
