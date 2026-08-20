use strict;
use warnings;

use Test::More tests => 2;

BEGIN {
	use_ok('Database::Join') or BAIL_OUT('Module failed to load');
}

ok(defined $Database::Join::VERSION, 'VERSION is defined');
