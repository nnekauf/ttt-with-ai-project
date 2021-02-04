class Game 
    attr_accessor :board, :player_1, :player_2
    WIN_COMBINATIONS = [
        [0,1,2], 
        [3,4,5], 
        [6,7,8],
        [0,4,8],
        [6,4,2],
        [0,3,6],
        [1,4,7],
        [2,5,8]
        ]

    def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
    end

    def current_player
        if board.turn_count.even?
            return player_1
            elsif board.turn_count.odd?
            return player_2
            end
    end

    def won?
        WIN_COMBINATIONS.detect do |win_combination|
        @board.cells[win_combination[0]] == @board.cells[win_combination[1]] && 
        @board.cells[win_combination[0]] == @board.cells[win_combination[2]] &&
        (@board.cells[win_combination[0]] == "X" || @board.cells[win_combination[0]] == "O")
        end

        
    end

        def draw?
            @board.full? && !won?
        end

        def over?
            won? || draw?
        end

        def winner
            if won?
                @win_combination = won?
            @winner = @board.cells[@win_combination[0]]
            @winner
            end
        end

        def turn
         #puts "Please enter 1-9:"
            @position = current_player.move(@board)
            if @board.valid_move?(@position)
            @board.update(@position, current_player)
            else
                #puts "Please enter 1-9:"
                turn
            end

        end

        def play
            turn until over?
            if won? 
                puts "Congratulations #{winner}!"
            elsif draw?
                puts "Cat's Game!"

            end

        end

end