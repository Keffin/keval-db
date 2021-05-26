require "socket"
module KevalDb

    class Client 
        def initialize 
            @socket = TCPSocket.new("localhost", 3000)
        end 

        def send(input)
            @socket.puts input 
            @socket.gets 
        end
    end 
    
    client = Client.new 
    client.send("Hello")
end 