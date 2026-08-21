# Generated from Makefile.PL using makefilepl2cpanfile

requires 'perl', '5.010';

requires 'Carp';
requires 'Database::Abstraction', '0.37';
requires 'List::Util', '1.33';
requires 'Params::Get', '0.13';
requires 'Params::Validate::Strict';
requires 'Readonly', '2.00';
requires 'Scalar::Util';
requires 'autodie';

on 'test' => sub {
	requires 'DBD::SQLite', '1.70';
	requires 'File::Temp';
	requires 'IPC::System::Simple';
	requires 'Test::Exception', '0.43';
	requires 'Test::Most', '1.302';
};

on 'develop' => sub {
	requires 'Devel::Cover';
	requires 'Perl::Critic';
	requires 'Test::Pod';
	requires 'Test::Pod::Coverage';
};
