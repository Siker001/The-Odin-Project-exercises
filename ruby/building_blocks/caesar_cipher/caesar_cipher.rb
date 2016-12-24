def cipher
	puts "Please type in a text what you would like to encript. Please note we convert only letters, everything else remains the same."
	text = gets.chomp
	puts "Please give me a number and we'll encript your text with the help of that number."
	change = gets.chomp.to_i
	if change == 0
		puts "Nothing to do here, the text remains the same: #{text}"
	else
		words = text.split(" ")
		result = []
		words.each do |wrd|
				wrd.scan(/./) do |x|
					y = x.sum
					if change > 0
						if (64 < y && y < 91)
							if (y+change) > 90
								y = 64 - (90-(y+change))
							else
								y += change
							end
						elsif (96 < y && y < 123)
							if (y+change) > 122
								y = 96 - (122-(y+change))
							else
								y += change
							end
						end
						result.push(y.chr)
					else
						if (64 < y && y < 91)
							if (y+change) < 65
								y = 91 - (65-(y+change))
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
						result.push(y.chr)
					end
				end
				result.push(" ")
		end
		puts words.join(" ")
		puts result.join
	end
end

cipher