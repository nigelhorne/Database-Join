use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
	NAME             => 'Database::Join',
	AUTHOR           => 'Nigel Horne <nigel.horne@gmail.com>',
	VERSION_FROM     => 'lib/Database/Join.pm',
	ABSTRACT_FROM    => 'lib/Database/Join.pm',
	LICENSE          => 'perl',
	MIN_PERL_VERSION => '5.010',
	PREREQ_PM        => {
		'autodie'                 => 0,
		'Carp'                    => 0,
		'Database::Abstraction'   => '0.37',
		'List::Util'              => '1.33',
		'Params::Get'             => '0.13',
		'Params::Validate::Strict' => 0,
		'Readonly'                => '2.00',
		'Scalar::Util'            => 0,
	}, TEST_REQUIRES => {
		'IPC::System::Simple' => 0,
		'Test::More'      => '1.302',
		'Test::Exception' => '0.43',
		'DBD::SQLite'     => '1.70',
		'File::Temp'      => 0,
	}, META_MERGE => {
		'meta-spec' => { version => 2 },
		resources   => {
			repository => {
				type => 'git',
				url  => 'https://github.com/nigelhorne/Database-Join.git',
				web  => 'https://github.com/nigelhorne/Database-Join',
			},
			bugtracker => {
				web => 'https://github.com/nigelhorne/Database-Join/issues',
			},
		},
	},
	dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz' },
	clean => { FILES    => 'Database-Join-*' },
);
