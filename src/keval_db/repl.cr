require "./db.cr"
module KevalDb
    class Repl 
        @@db = DataBase(String, String).new 
        
        @@db["fd"] = "ff"
        def main_loop   
            
            while true 
                print "> "
                user_input = gets
                command = nil_splitter user_input 
                # Must do explicit cast because split method does in fact return Array of Strings
                # However when indexing, e.x typeof(command[0]) => (Char | String), i get this union type
                # Had to cast it explicity as a string of array to handle Strings only, as the db is string type
                commands = command.as(Array(String))
            
                case commands[0]
                when "stop"
                    puts "Shutting down...."
                    break  
                when "get"
                    handle_get(commands[1], @@db)
                when "set"
                    handle_set(commands[1], commands[2], @@db)
                when "delete"
                    handle_delete(commands[1], @@db)
                when "print"
                    handle_print(@@db)
                when "purge"
                    puts "Removing all"
                else 
                    puts "Not a valid command!"
                end 
            end 
        end 

        # Can't split strings when using gets due to string being union type of String or Nil
        # Current work-around, TODO: handle nil better
        def nil_splitter(input : String | Nil) : Array(String) | String 
            if input.nil? 
                ""
            else 
                input.split(" ").map{|word| word.strip}
            end 
        end 

        def handle_get(key, db)
            val = db.get(key)
            puts val 
        end 

        def handle_set(key, val, db)
            db.set(key, val)
            puts "Set #{key} -> #{val}"
        end 

        def handle_delete(key, db)
            db.delete(key)
            puts "Deleted #{key}"
        end 

        def handle_print(db)
            db.print 
        end 

    end 
end 