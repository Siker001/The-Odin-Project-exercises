require 'csv'

# Checks phone numbers by given preferences.
def clean_phone(phone)
	clean_phone = phone.gsub(/[^\d]/, '')
	if clean_phone.length < 10 || clean_phone.length > 11
		puts "Phone number is not valid."
	elsif clean_phone.length == 11 && clean_phone.split('')[0].to_i == 1
		puts clean_phone.split('').drop(1).join
	elsif clean_phone.length == 11
		puts "Phone number is not valid."
	else
		puts clean_phone
	end
end

# Converts string to time format then gets only hours.
def get_hours(time)
	DateTime.strptime(time, '%m/%d/%Y %H:%M').strftime('%H')
end

# Iterates through given array(arr), by given total array(total).
# When it finds a y element of arr which is also found in total, pushes it into target hash with total[i] as key and increases value by 1.
def target(total, arr)
	target = {}
	arr.each do |y|
		total.each do |i|
			if y.to_i == i
				target[i] = target[i].to_i + 1			
			end
		end
	end
	target
end

# Converts string to time format then gets the day of it.
def day_targeting(time)
	DateTime.strptime(time, '%m/%d/%Y %H:%M').wday
end

# Sends target method the total array what it needs to search in and arr which needs to be searched with.
# The result will be a hash, gets sorted by value in a descending order. Then prints out.
def popular_hours(all_hours)
	print target((0..23), all_hours).sort_by { |_key, value| value }.reverse
	puts ""
end

# Sends target method the total array what it needs to search in and arr which needs to be searched with.
# The result will be a hash, which keys are being changed by the name of the days instead of the number of it.
# Then it gets sorted by value in a descending order. Then prints out.
def popular_days(all_days)
	days = { 0 => "Sunday", 1 => "Monday", 2 => "Tuesday", 3 => "Wednesday", 4 => "Thursday", 5 => "Friday", 6 => "Saturday" }
	print target((0..6), all_days).map { |k, v| [days[k] || k, v] }.to_h.sort_by { |_key, value| value }.reverse
	puts ""
end

puts "Initialized!"

# Opens csv file, notices it has header and converts it to symbol. Stores all in contents variable.
contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

# Used variables.
all_hours = []
all_days = []

# Iterates through each row of the contents and calls methods on it respectively.
contents.each do |row|
	phone = row[:homephone]
	time = row[:regdate]
	
	clean_phone(phone)
	all_hours << get_hours(time)
	all_days << day_targeting(time)
end

popular_hours(all_hours)
popular_days(all_days)
