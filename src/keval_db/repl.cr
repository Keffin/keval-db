#require "readline"
#s = Readline.readline("> ")
module KevalDb

    class Repl 
        
        def main_loop   
            while true 
                print "> "
                user_input = gets
                command = nil_splitter user_input 
                #puts command 

                case command[0] 
                when "stop"
                    puts "Shutting down...."
                    break  
                when "get"
                    puts "getter func" 
                when "set"
                    puts "setter func"
                when "delete"
                    puts "delete func"
                when "purge"
                    puts "Removing all"
                else 
                    puts "Not a valid command!"
                end 
            end 
        end 

        # Can't split strings when using gets due to string being union type of String or Nil
        # Current work-around, TODO: handle nil better
        def nil_splitter(input : String | Nil)
            if input.nil? 
                ""
            else 
                input.split(" ").map{|word| word.strip}
            end 
        end 

    end 
end 