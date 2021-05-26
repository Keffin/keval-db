require "socket"

module KevalDb

    class Server 
        
        def initialize
            @server = TCPServer.new("localhost", 3000)
        end 

        def accept? 
            @server.accept? 
        end 

        def handle_client(client)    
            puts "Connected #{client}"
            while msg = client.gets 
                puts "[#{client}] Message: #{msg}"
                client.puts msg 
            end 
        end 


        def parse_msg
            while client = @server.accept? 
                spawn handle_client client 
            end 
        end 
    end 

    
    s = Server.new 
    s.parse_msg 
end 