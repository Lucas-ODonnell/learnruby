require "csv"
require "google/apis/civicinfo_v2"
require "erb"

def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, "0")[0..4]
end

def formatted_phone(phone_number)
  numbers = ("0".."9").to_a 
  formatted = phone_number.to_s.split("").map { |ele| ele if numbers.include?(ele) }
  formatted.join("")
end

def clean_phone(phone_number)
  formatted = formatted_phone(phone_number)
  begin 
  if formatted.length == 10
      formatted.insert(3,"-").insert(-5,"-") 
    elsif formatted.length == 11 && formatted.split("").first == "1"
      new_number = formatted.split("")
      new_number.shift
      new_number.join("").insert(3,"-").insert(-5, "-")
  end
  rescue
  "You did not provide us with your phone number."
  end
end

def legislators_by_zipcode(zipcode)
    civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
    civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'
   
    begin
    civic_info.representative_info_by_address(
                            address: zipcode,
                            levels: 'country',
                            roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
    rescue
    "You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials"
    end
end

def save_thank_you_letter(id,form_letter)
  Dir.mkdir("output") unless Dir.exists?("output")

  filename = "output/thanks_#{id}.html"

  File.open(filename,'w') do |file|
    file.puts form_letter
  end
end

puts "EventManager initialized."
puts

contents = CSV.open "./../event_attendees.csv", headers: true, header_converters: :symbol

template_letter = File.read "./../form_letter.erb"
erb_template = ERB.new template_letter


contents.each do |row|
  id = row[0]
  name = row[:first_name]
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)
  individuals_phone = clean_phone(row[5])

  form_letter = erb_template.result(binding)

  save_thank_you_letter(id,form_letter)
end

