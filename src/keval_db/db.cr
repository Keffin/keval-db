module KevalDb

    class DataBase(K, V)

        def initialize 
            @db = Hash(K, V).new  
        end 
        
        def [](key : K) : V
            get(key)
        end 

        def get(key : K) : V
            if @db[key]? 
                @db[key]
            else 
                "#{key.to_s} is not an existing key, can not get it!"
                #raise KeyError.new("#{key.to_s} is not an existing key")
            end 
        end 

        def []=(key : K, value : V) : V
            set(key, value)
        end 

        def set(key : K, value : V) : V
            @db[key] = value 
            value
        end 

        def delete(key : K)
            if @db.has_key?(key)
                @db.delete(key)
            else 
                "#{key.to_s} is not an existing key, can not delete!"
            end  
        end 

        def print 
            @db.each do |key, value|
                puts "#{key} : #{value}"
            end 
        end 

    end 

    
    
end 