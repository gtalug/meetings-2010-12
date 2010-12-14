#!/usr/bin/ruby
require 'socket'

puts "Starting up server..."

# establish the server
# Server established to listen for connections on port 2008
server = TCPServer.new(2008)

# setup to listen and accept connections
while (session = server.accept)

  # start new thread conversation
  # Here we will establish a new thread for a connection client
  Thread.start do

    # I want to be sure to output something on the server side
    # to show that there has been a connection
    puts "log: Connection from #{session.peeraddr[2]} at #{session.peeraddr[3]}"
    puts "log: got input from client"

    # let's see what the client has to say by grabbing the input
    # then display it. Please note that the session.gets will look
    # for an end of line character "\n" before moving forward.
    input = session.gets
    puts input

    # Lets respond with a nice warm welcome message
    session.puts "Server: Welcome #{session.peeraddr[2]}\n"

    # reply with goodbye
    # now lets end the session since all we wanted to do is
    # acknowledge the client
    puts "log: sending goodbye"
    session.puts "Server: Goodbye\n"

  end

end

