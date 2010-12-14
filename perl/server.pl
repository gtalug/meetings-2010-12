use IO::Socket;

my $sock = new IO::Socket::INET(
	LocalHost => '127.0.0.1',
	LocalPort => '9999',
	Proto => 'tcp',
	Listen => 1,
	Reuse => 1,
);

my $new_sock = $sock->accept();

while(<$new_sock>) {
	print $_;
}

close($sock);
