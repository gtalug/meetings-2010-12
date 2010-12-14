import sys
import socket



def main(data):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    
    sock.connect((HOST, PORT))
    sock.send(data + "\n")
    
    received = sock.recv(1024)
    sock.close()
    
    print "Sent:        %s" % data
    print "Received:    %s" % received

if __name__ == "__main__":
    HOST, PORT = "127.0.0.1", 9999
    
    main(" ".join(sys.argv[1:]))