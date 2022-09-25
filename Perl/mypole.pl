package BeerDB;
use strict;
use warnings;

# choose a frontend, initialise the config object, and load a plugin
use Maypole::Application qw/Relationship/;

# set everything up
__PACKAGE__->setup("dbi:SQLite:t/beerdb.db");

# get the empty config object created by Maypole::Application
my $config = __PACKAGE__->config;

# basic settings
$config->uri_base("http://localhost/beerdb");
$config->template_root("/path/to/templates");
$config->rows_per_page(10);
$config->display_tables([qw/beer brewery pub style/]);

# table relationships
$config->relationships([
    "a brewery produces beers",
    "a style defines beers",
    "a pub has beers on handpumps",
    ]);

# validation
BeerDB::Brewery->untaint_columns( printable => [qw/name notes url/] );
BeerDB::Pub->untaint_columns( printable => [qw/name notes url/] );
BeerDB::Style->untaint_columns( printable => [qw/name notes/] );
BeerDB::Beer->untaint_columns(
    printable => [qw/abv name price notes/],
    integer => [qw/style brewery score/],
    date => [ qw/date/],
);

# note : set up model before calling this method
BeerDB::Beer->required_columns([qw/name/]);

1;