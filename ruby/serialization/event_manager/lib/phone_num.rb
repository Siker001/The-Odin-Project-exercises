require 'csv'

def clean_zipcode(zipcode)
	zipcode.to_s.rjust(5, "0")[0..4]
end

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


puts "Initialized!"

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

contents.each do |row|
	id = row[0]
	name = row[:first_name]
	phone = row[:homephone]
	
	clean_phone(phone)
end

