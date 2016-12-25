# Substrings
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(word, dictionary)
	$result = {}

	dictionary.each do |x|
		if (word.include? x)
			$result[x] = 1
		end
	end

	puts $result
end

substrings("below", dictionary)