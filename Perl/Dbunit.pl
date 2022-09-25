use DBIx::Connection;

use Test::DBUnit connection_name => 'test';
use Test::More tests => $tests;

DBIx::Connection->new(
    name     => 'test',
    dsn      => $ENV{DB_TEST_CONNECTION},
    username => $ENV{DB_TEST_USERNAME},
    password => $ENV{DB_TEST_PASSWORD},
);

#or

use Test::DBUnit;
use Test::More tests => $tests;
use DBI;

my $dbh = DBI->connect(...);
add_test_connection('test', $dbh)

#or

use Test::More;
use Test::DBUnit dsn => 'dbi:Oracle:localhost:1521/ORACLE_INSTANCE', username => 'user', password => 'password';
plan tests => $tests;

my $connection = test_connection();
my $dbh = test_dbh();