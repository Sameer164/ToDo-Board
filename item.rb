class Item

    attr_accessor :title, :deadline, :description
    attr_reader :done
    def self.valid_date?(str)
        arr = str.split('-')
        if (arr[0].to_i >= 1000) && (arr[1].to_i > 0 && arr[1].to_i < 13) && (arr[2].to_i > 0 && arr[2].to_i < 32)
            return true
        end
        return false
    end

    def initialize(title, deadline, description)
        @title = title
        if Item.valid_date?(deadline)
            @deadline = deadline
        else
            raise "The Deadline is not Valid"
        end
        @description = description
        @done = false

    end

    def toggle
        @done = !(@done)
    end


end

