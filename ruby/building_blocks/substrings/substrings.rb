# Substrings
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(word, dictionary)
	$result = {}
	more = word.downcase.split(" ")
	more.each do |y|
		dictionary.each do |x|
			if (y.include? x)
				$result[x] = $result[x].to_i + 1
			end
		end
	end
	puts $result
end

substrings("Howdy partner, sit down! How's it going?", dictionary)