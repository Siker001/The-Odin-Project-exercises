# Substrings
# Giving a string to the method and method checkes how many words matches in the string in its dictionary words.

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(word, dictionary)
	$result = {}
	more = word.downcase.split(" ") 	# Change to non case sensitiveness with converting the string to downcase and then slitting it up into words into an array.
	more.each do |y| 					# Iterating through each word.
		dictionary.each do |x| 			# Iterating through the dictionary one by one and checking each one of them with the words.
			if (y.include? x) 			# Checking if the given word is including the given dictionary's word(x).
				$result[x] = $result[x].to_i + 1 		# If it does include, then add it to the $result hash with the hashkey of the given dictionary's word(x) and moving up its value number by 1.
			end
		end
	end
	puts $result
end

substrings("Howdy partner, sit down! How's it going?", dictionary)