require "http"

module KevalDb

    class Server 
        @@server = HTTP::Server.new do |ctx|
            ctx.response.content_type = "text/plain"
            ctx.response.print "HEllo"
        end
        
        address = @@server.bind_tcp 8080
        puts "Listening on #{address}"
        @@server.listen 
    end 

    s = Server.new 
end 