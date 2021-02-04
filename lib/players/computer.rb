require "pry"
module Players
    class Computer < Player
        def move(board)
            #valid_positions = []
                        n = 0
# #iterate thru the board that is passed in. for each empty spot, I will number it starting with 1
            
            board.cells.each do|space| 
                if space == " "
                   return "#{n+=1}"
                 end
                end

            #valid_positions
        end
    end

end

