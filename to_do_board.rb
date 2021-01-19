require_relative './item.rb'
require_relative './list.rb'

class TodoBoard
    def initialize()
        @label_hash = {}
    end

    def get_command
        puts "Enter a Command"
        cmd, cmd2, *args = gets.chomp.split(' ')
        
        case cmd
        when 'mklist'
            @label_hash[cmd2] = List.new(cmd2)
            return true
        when 'ls'
            puts '--------------------------------'
            @label_hash.each_key do |label|
                puts label
            end
            puts '--------------------------------'
            return true
        when 'showall'
            @label_hash.each_value do |list|
                puts list.prints
            end
            return true
        when 'mktodo'
            @label_hash[cmd2].add_item(*args)
            return true
        when 'toggle'
            @label_hash[cmd2].toggle_item(args[0].to_i)
            return true
        when 'rm'
            @label_hash[cmd2].remove_item(args[0].to_i)
            return true
        when 'purge'
            @label_hash[cmd2].purge
            return true
        when 'up'
            if args.length == 2
                @label_hash[cmd2].up(args[0].to_i, args[1].to_i)
                return true
            else
                @label_hash[cmd2].up(args[0].to_i)
                return true
            end
        when 'down'
            if args.length == 2
                @label_hash[cmd2].down(args[0].to_i, args[1].to_i)
                return true
            else
                @label_hash[cmd2].down(args[0].to_i)
                return true
            end
        when 'swap'
            @label_hash[cmd2].swap(args[0].to_i, args[1].to_i)
            return true
        when 'sort'
            @label_hash[cmd2].sort_by_date!
            return true
        when 'priority'
            @label_hash[cmd2].print_priority
            return true
        when 'print'
            if args.length == 1
                @label_hash[cmd2].print_full_item(args[0].to_i)
                return true
            else
                @label_hash[cmd2].prints
                return true
            end
        when 'quit'
            return false

        else
            'Sorry! The Command Is Not Valid'
        end
        
        
        
        
        # case cmd2
        # when 'mktodo'
        #     @list.add_item(*args)
        #     return true
        # when 'quit'
        #     return false
        # when 'up'
        #     @list.up(args[0].to_i, args[1].to_i)
        #     return true
        # when 'down'
        #     @list.down(args[0].to_i, args[1].to_i)
        #     return true
        # when 'swap'
        #     @list.swap(args[0].to_i, args[1].to_i)
        #     return true
        # when 'sort'
        #     @list.sort_by_date!
        #     return true
        # when 'priority'
        #     @list.print_priority
        #     return true
        # when 'print'
        #     if args.length == 1
        #         @list.print_full_item(args[0].to_i)
        #         return true
        #     else
        #         @list.prints
        #         return true
        #     end
        # when 'toggle'
        #     ind = args[0].to_i
        #     @list.toggle_item(ind)
        #     return true
        # when 'rm'
        #     @list.remove_item(args[0].to_i)
        #     return true
        # when 'purge'
        #     @list.purge
        #     return true
        # else
        #     print "Sorry, that command is not recognized."
        #     return true
        # end

    end        
    
    def run
        while get_command
            get_command
        end
    end
end


my_board = TodoBoard.new()
my_board.run
