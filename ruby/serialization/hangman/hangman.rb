=begin
class Display

	attr_accessor :board, :current_guess, :missed_letters, :turns

	def initialize
		@board = []
		@current_guess
		@missed_letters
		@turns
	end

end

=end


class Game 
	
	#attr_accessor :secret_word

	def initialize
		@board = []
		@current_guess = ""
		@missed_letters = []
		@turns = 1
		@secret_word = get_secret_word
		@winner = false
		play
	end

	private

	def get_secret_word
		words = []
		File.readlines('5desk.txt').join.split.each do |item|
			if 4 < item.length && item.length < 13
				words << item
			end
		end
		@secret_word = words[Random.rand(1..words.length)].downcase
		@secret_word.length.times { |i| @board << "_" }
		@secret_word
	end

	def intro
		puts "Welcome to the game of Hangman. Your goal is to figure out the word what we've thought about."
		puts "You can guess by typing in 1 letter. You win if you find out the word within 15 rounds."
	end

	def display
		print "Find out the following word: #{@board.join}"
		puts ""
		print "The missed words so far: #{@missed_letters.join(',')}"
		puts ""
	end

	def interact
		gets.chomp.downcase
	end

	def guess
		answ = ""
		used = true
		until ("a".."z").include?(answ) && !used
			puts "Give me a letter between a and z."
			answ = interact
			if @missed_letters.include?(answ)
				puts "You've already guessed this letter, choose an other one."
				used = true
			else
				used = false
			end
		end
		@secret_word.split(//).each_with_index do |item, index|
			if item == answ
				@board[index] = item
			end
		end
		unless @secret_word.include?(answ)
			@missed_letters << answ
		end
	end

	def win
		if @board.all? { |e| ("a".."z").include?(e) }
			@winner = true
		end
	end

	def farewell
		if @winner
			puts "Congratulation! You've won. The secret word was #{@secret_word}."
		else
			puts "Better luck next time. You missed it. The secret word was #{@secret_word}."
		end
	end

	def play
		intro
		while @turns < 16 && !@winner
			puts "This is your #{@turns}. guess."
			guess
			display
			win
			@turns += 1
		end
		farewell
	end
	
end

test = Game.new

