#!/usr/bin/ruby
require 'socket'

# establish connection
# We need to tell the client where to connect
# Conveniently it is on localhost at port 2008!
clientSession = TCPSocket.new("localhost", 2008)
puts "log: starting connection"

#send a quick message
# Note that this has a carriage return. Remember our server
# uses the method gets() to get input back from the server.
puts "log: #{ARGV.first}"
clientSession.puts "Client: #{ARGV.first}\n"

# wait for messages from the server
# You've sent your message, now we need to make sure
# the session isn't closed, spit out any messages the server
# has to say, and check to see if any of those messages
# contain 'Goodbye'. If they do we can close the connection
while !(clientSession.closed?) && (serverMessage = clientSession.gets)

  # lets output our server messages
  puts serverMessage

  #if one of the messages contains 'Goodbye' we'll disconnect
  # we disconnect by 'closing' the session.
  if serverMessage.include?("Goodbye")
   puts "log: closing connection"
   clientSession.close
  end

end
