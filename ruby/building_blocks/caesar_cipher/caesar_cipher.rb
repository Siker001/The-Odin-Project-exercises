# Caesar's encrypting method moves the original letters towards or backwards in the ASCII character table. Technically it could move any character, I applied only to letters.
# Asks user for text, and also for a number to work with. If given 5 then gives back a string with every letter moved 5 characters forward in the ASCII table.
# Wraps automaticly at A and Z, a and z.

def cipher
	puts "Please type in a text what you would like to encript. Please note we convert only letters, everything else remains the same."
	text = gets.chomp 			# Remove the useless enter character from user imput.
	puts "Please give me a number and we'll encript your text with the help of that number."
	change = gets.chomp.to_i
	if change == 0 				# When given 0, there's nothing to move.
		puts "Nothing to do here, the text remains the same: #{text}"
	else
		words = text.split(" ") 	# Split the long text into words by the spaces into an array.
		result = []
		words.each do |wrd| 		# Iterating through the array.
				wrd.scan(/./) do |x| 	# Checking and changing each character within each word seperately.
					y = x.sum 			# y is the ASCII value of the currently checked x character.
					if change > 0 		# The wrapping process is slightly different depending on moving forward or backward the letters in the ASCII table.
						if (64 < y && y < 91) 	# That is between A and Z.
							if (y+change) > 90 	# The part above 90 needs to add after the 64 which is the lowest entry point into our examined changing array.
								y = 64 - (90-(y+change)) 	# Here we use ' - ' because the difference between 90 and y+change will be bigger than 90 resulting in a negativ number. And - plus - is positive.
							else
								y += change 		# When the number is not needed to be wrapped at Z or z, just regularly add to it.
							end
						elsif (96 < y && y < 123) # Same as above just with lower case letters.
							if (y+change) > 122
								y = 96 - (122-(y+change))
							else
								y += change
							end
						end
						result.push(y.chr) 			# Push the results(the changed letters) into the result array.
					else
						if (64 < y && y < 91) 		# This one is for the negativ numbers, when user wants to move the letters backwards(downwards) on the ASCII table.
							if (y+change) < 65
								y = 91 - (65-(y+change)) # We need to count difference from the other end, but basically the same logic as above.
							else
								y += change
							end
						elsif (96 < y && y < 123)
							if (y+change) < 97
								y = 123 - (97-(y+change))
							else
								y += change
							end
						end
						result.push(y.chr) 			# Here also need to push the results(the changed letters) into the result array.
					end
				end
				result.push(" ") 	# After each word push a space into that array.
		end
		puts words.join(" ") 		# puts out the original string to compare with the new one.
		puts result.join 			# Joining the array.
	end
end

cipher