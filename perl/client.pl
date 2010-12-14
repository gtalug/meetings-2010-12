use IO::Socket;

my $sock = new IO::Socket::INET(
	PeerAddr => '127.0.0.1',
	PeerPort => '9999',
	Proto => 'tcp'
);

die "Could not create socket: $!\n" unless $sock;

print $sock "Hello, World!\n";

close($sock);
