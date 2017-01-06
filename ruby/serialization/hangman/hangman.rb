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

# Randomly chooses a secret word from the provided text file.
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

# Displays @board and @missed_letters into console.
	def display
		print "Find out the following word: #{@board.join}"
		puts ""
		print "The missed words so far: #{@missed_letters.join(',')}"
		puts ""
	end

# Gets user input.
	def interact
		gets.chomp.downcase
	end

# Asks for a guess, checks if that input is following standards.
# Iterate through secret word's letters and checks if the user answ is among it or not.
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

# When all characters of @board are a..z, changes @winner to true so the play loop stops.
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

# Asks for a name to save the game.
# Create a hash form of instance variables to work with.
# Creates a json file with writing this previously created hash file into it with converting that to_json.
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

# Lists all files in save folder. Then asks for a name to open it.
# Opens json file(read), then parsing it. Now you have a hash.
# Re-assign all instance variables with the matching variables in the parsed json file's value. 
# We have only 1 value each, so with [0] gets an easy access to it in the correct class format.
	def open_saved
		print Dir["./save/*"]
		puts ""
		puts "Type in the name of the file you would like to open. Only the part in front of '.json'."
		opening = interact
		file = File.read("./save/#{opening}.json")
		parsed = JSON.parse(file)
		@board = parsed.values_at("@board")[0]
		@missed_letters	= parsed.values_at("@missed_letters")[0]
		@turns = parsed.values_at("@turns")[0]
		@secret_word = parsed.values_at("@secret_word")[0]
		@winner	= parsed.values_at("@winner")[0]
	end

# The whole game runs here.
# Asks if open a saved file, if not it continues.
# While it's under 16 turns and there is no winner, the loop will run.
# At each turn it asks for save, if gets save, save method runs. Else just asks for guess.
# Displays the board and the missed letters, checks for win and increses turns. Finally puts farewell respectively.
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
		farewell
	end
	
end

test = Game.new

