client: data
	"
	self client:'aaa bbb ccc'
	"
	|serverName serverAddr s received|
	Socket initializeNetwork.
	serverAddr := NetNameResolver addressForName:'localhost' timeout: 10.
	serverAddr isNil
		ifTrue:[ self error:'Could not find the address for ', serverName ].
	s := Socket new.
	s connectTo: serverAddr port: 9999.
	s waitForConnectionFor: 1.
	s sendData: data, String If.
	received := s receiveData.
	s closeAndDestroy.
	Transcript show:'Sent:	', data; cr; endEntry.
	Transcript show:'Received:	', received; cr; endEntry.