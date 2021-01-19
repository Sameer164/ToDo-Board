require_relative './item.rb'
require 'byebug'

class List
    
    attr_accessor :label
    
    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description = '')
        
        if Item.valid_date?(deadline)
            instance = Item.new(title, deadline, description)
            @items << instance
            return true
        else
            return false
        end
    end

    def toggle_item(index)
        @items[index].toggle
    end

    def remove_item(index)
        @items.delete_at(index)
    end
    
    def size
        return @items.length
    end

    def purge
        @items.filter! {|item| !item.done}
    end

    def valid_index?(index)
        if index < 0 || index >= @items.length
            return false
        else
            return true
        end
    end

    def swap(ind1, ind2)
        if valid_index?(ind1) && valid_index?(ind2)
            @items[ind1], @items[ind2] = @items[ind2], @items[ind1]
            return true
        else
            return false
        end
    end

    def [](index)
        if !valid_index?(index)
            return nil
        else
            return @items[index]
        end
    end

    def priority
        return @items[0]
    end

    def prints
        puts
        puts
        puts '----------------------------------------------------------------------'
        puts
        puts "                             #{@label}                               "
        puts
        puts '-----------------------------------------------------------------------'
        puts "Index     | Item                              | Deadline   | Completed?     "
        puts "-----------------------------------------------------------------------"
        @items.each_with_index do |item, index|
            new_atr = index.to_s.ljust(10)
            new_atr2 = item.title.ljust(34)
            new_atr3 = item.done
        print "#{new_atr}| #{new_atr2}| #{item.deadline} | #{new_atr3}"
        puts
        puts
        end
        puts "-----------------------------------------------------------------------"
        puts
    end

    def print_full_item(index)
        item = @items[index]
        puts
        puts
        puts "-----------------------------------------------------------"
        title = item.title.ljust(49)
        print title + item.deadline
        puts
        print "Completed?: #{item.done}"
        puts
        print item.description 
        puts
        puts "-----------------------------------------------------------"
        puts
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount = 1)
        if !valid_index?(index)
            return false
        else
            current_index = index
            amount.times do
                if !(current_index == 0)
                    swap(current_index, current_index - 1)
                    current_index -= 1
                else
                    break
                end
            end
            return true
        end
        
    end
    
    def down(index, amount = 1)
        if !valid_index?(index)
            return false
        else
            current_index = index
            amount.times do
                if !(current_index == (@items.length - 1))
                    swap(current_index, current_index + 1)
                    current_index += 1
                else
                    break
                end
            end
            return true
        end
    end
    
    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end

    

end







