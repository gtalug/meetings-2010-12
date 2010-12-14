server
	"Example code for TLUG Dynamic Language Panel.
	[ self server ] fork
	"
	|sock|
	Socket initializeNetwork.
	sock := Socket new.
	sock inspect.
	sock listenOn: 9999.
	[|done|
	  done := false.
	  [done] whileFalse:[|received|
	    sock waitForConnectionFor: Socket standardTimeout.
	    received := sock receiveData trimRight.
	    Transcript cr; show:'wrote:', received;cr;endEntry.
	    sock sendData:received asUppercase, String If.
	    received = 'done' ifTrue:[ done:= true ]
	  ]
	] ensure: [ sock closeAndDestroy ]