import SocketServer

class TCPHandler(SocketServer.BaseRequestHandler):
    
    def handle(self):
        self.data = self.request.recv(1024).strip()
        print "%s wrote: " % self.client_address[0]
        print self.data
        
        self.request.send(self.data)

if __name__ == "__main__":
    HOST, PORT = "127.0.0.1", 9999
    
    server = SocketServer.TCPServer((HOST, PORT), TCPHandler)
    
    server.serve_forever()