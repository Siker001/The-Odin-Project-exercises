require 'json'


class Game 

	def initialize
		@board = []
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
		puts "You have the option to start a new game or to open one of your saved games."
		puts "Type in 'open' to open one of your previously saved games."
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

	def save
		puts "Type in a name to save your changes."
		name = interact
		save_this = {
			"@board" => @board,
			"@missed_letters" => @missed_letters,
			"@turns" => @turns,
			"@secret_word" => @secret_word,
			"@winner" => @winner
		}
		File.open("./save/#{name}.json", "w") do |f|
			f.write(save_this.to_json)
		end
		puts "Your game was saved under the name of '#{name}'. Bye"
	end

	def open_saved
		print Dir["./save/*"]
		puts ""
		puts "Type in the name of the file you would like to open. Only the part in fron to '.json'."
		opening = interact
		file = File.read("./save/#{opening}.json")
		parsed = JSON.parse(file)
		@board = parsed.values_at("@board")[0]
		@missed_letters	= parsed.values_at("@missed_letters")[0]
		@turns = parsed.values_at("@turns")[0]
		@secret_word = parsed.values_at("@secret_word")[0]
		@winner	= parsed.values_at("@winner")[0]
	end

	def play
		intro
		if interact == "open"
			open_saved
		end
		display
		while @turns < 16 && !@winner
			puts "This is your #{@turns}. guess."
			puts "You have an option to save your current progress. Just write save into the consol."
			if interact == "save"
				save
				return
			else
				guess
			end
			display
			win
			@turns += 1
		end
		puts @winner
		farewell
	end
	
end

test = Game.new

