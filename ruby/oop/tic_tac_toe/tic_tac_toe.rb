# I know it looks ugly but works. I will refactor later when I improved my knowledge.

class Board
	def initialize
		@@board = [["_","_","_"],["_","_","_"],["_","_","_"]]
	end
end


class Game < Board

	def initialize(winner, turns)
		Board.new
		@winner = winner
		@turns = turns
		play
	end

	private

	@@user1 = {name: "", pick: "", won: false}
	@@user2 = {name: "", pick: "", won: false}

	def intro
		puts "This is a basic tic-tac-toe game. You'll have a board, 2 users can play. "
	end

	def show
		@@board.each do |y|
			y.each { |x| print x.to_s }
			puts ""
		end
	end

	def interact
		gets.chomp 
	end

	def name(arg)
		answ = nil
		while answ.to_s.length <= 0
			puts "What is your name, #{arg}?"
			answ = interact
		end
		answ
	end

	def pick
		answ = nil
		while (answ != "X") && (answ != "O")
			puts "Please choose your character. Can be X or O. The other player will be assigned automaticle to the other character."
			answ = interact.to_s.upcase
		end
		answ
	end

	def update_board(character)
		runner = false
		while runner == false
			row = 0
			column = 0
			puts "Have a look on the board and decide where you would like to put your next mark."
			until (1..3).cover?(row)
				puts "Type in the number of the row where you would like to put your mark. It can be 1 or 2 or 3."
				row = interact.to_i
			end
			until (1..3).cover?(column)
				puts "Type in the number of the column where you would like to put your mark. It can be 1 or 2 or 3."
				column = interact.to_i
			end

			if @@board[row-1][column-1] == "_"
				@@board[row-1][column-1] = character
				runner = true
			else
				puts "That place is already marked. You should choose an other one."
			end
		end
	end

# This needs plenty of refactoring.
	def win
		win_o = 0
		win_x = 0
		@@board.each do |i|
			if i.all? { |e| e == "O" }
				win_o += 1
			end
		end
		if (@@board[0][0] == "O") && (@@board[1][0] == "O") && (@@board[2][0] == "O")
			win_o += 1					
		elsif (@@board[0][1] == "O") && (@@board[1][1] == "O") && (@@board[2][1] == "O")
			win_o += 1				
		elsif (@@board[0][2] == "O") && (@@board[1][2] == "O") && (@@board[2][2] == "O")
			win_o += 1
		elsif (@@board[0][0] == "O") && (@@board[1][1] == "O") && (@@board[2][2] == "O")
			win_o += 1
		elsif (@@board[2][0] == "O") && (@@board[1][1] == "O") && (@@board[0][2] == "O")
			win_o += 1
		end
		@@board.each do |i|
			if i.all? { |e| e == "X" }
				win_x += 1
			end
		end
		if (@@board[0][0] == "X") && (@@board[1][0] == "X") && (@@board[2][0] == "X")
			win_x += 1					
		elsif (@@board[0][1] == "X") && (@@board[1][1] == "X") && (@@board[2][1] == "X")
			win_x += 1				
		elsif (@@board[0][2] == "X") && (@@board[1][2] == "X") && (@@board[2][2] == "X")
			win_x += 1
		elsif (@@board[0][0] == "X") && (@@board[1][1] == "X") && (@@board[2][2] == "X")
			win_x += 1
		elsif (@@board[2][0] == "X") && (@@board[1][1] == "X") && (@@board[0][2] == "X")
			win_x += 1					
		end
		if win_o == 1 
			@winner = true
			if @@user1[:pick] == "O"
				@@user1[:won] = true
			elsif @@user2[:pick] == "O"
				@@user2[:won] = true
			end
		elsif win_x == 1
			@winner = true
			if @@user1[:pick] == "X"
				@@user1[:won] = true
			elsif @@user2[:pick] == "X"
				@@user2[:won] = true
			end
		end
	end

	def play
		intro
		@@user1[:name] = name("User 1")
		@@user1[:pick] = pick
		@@user2[:name] = name("User 2")
		if @@user1[:pick] == "X"
			@@user2[:pick] = "O"
		else
			@@user2[:pick] = "X"
		end
		show
		while (@winner != true) && (@turns <= 5)
			puts "It is your turn #{@@user1[:name]}."
			update_board(@@user1[:pick])
			show
			win
			if @winner
				break
			end
			puts "It is your turn #{@@user2[:name]}."
			update_board(@@user2[:pick])
			show
			win
			@turns += 1
		end
		if @winner
			puts "The game is over and we have a winner."
			if @@user1[:won]
				puts "And the winner is: #{@@user1[:name]}"
			elsif @@user2[:won]
				puts "And the winner is: #{@@user2[:name]}"
			end
			puts "Congratulation! You can have a look again on the board."
		else
			puts "The game is over. Looks like the scores are equal. There is no winner."
		end
		show
	end


end

tic = Game.new(false, 0)