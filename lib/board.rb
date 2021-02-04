class Board
    attr_accessor :cells

    def initialize
        reset!
    end

    def reset!
        @cells = Array.new(9, " ")
    end

    def display
        puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
        puts "-----------"
        puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
        puts "-----------"
        puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    end

    def position(user_input)
        cells[user_input.to_i - 1]
    end

    def full?
        if @cells.include? (" ")
            return false 
          else
            return true
          end
    end

    def turn_count
        turns = 0 
        @cells.each do |character|
          if character == "X" || character == "O"
            turns +=1 
          end
        end
        return turns  
    end

    def taken?(location)
        @cells[location.to_i - 1] == "X" || @cells[location.to_i - 1] == "O"
        #@cells[location] != " " && @cells[location] != ""
    end

    def valid_move?(position)
        !taken?(position) && position.to_i >0 && position.to_i <=9
      end
    # def valid_move?(user_input)
    #     user_input.to_i.between?(1,9) && !taken?(user_input)
    # end

    def update(position, player)
        cells[position.to_i - 1 ] = player.token
    end
end