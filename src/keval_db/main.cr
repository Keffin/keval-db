require "./repl.cr"
module KevalDb

    def self.start 
        repl = Repl.new 
        repl.main_loop
    end 

    start 
end 