films = ARGV[0] || "../movies.txt"

unless File.exist?(films)  
  abort "Такого файла не существует"
end

allfilms = File.readlines(films)  
allfilms.map!{|i| i.split("|")}

viewfilms = []
allfilms.each do |film|
  viewfilms << Hash[:link, film[0], :name, film[1], :year, film[4], :country, film[3], :genre, film[5], :duratation,  film[6], :rating, film[7], :director, film[8], :actors, film[9]]
end
 
counter = 0
viewfilms.sort_by { |hsh| hsh[:duratation] }.reverse[0...5].each do |viewfilm|
  counter += 1
  print "#{counter}. #{viewfilm[:name]}: #{viewfilm[:director]} (#{viewfilm[:year]}, #{viewfilm[:actors][0...-1]+"\\n"}, #{viewfilm[:country]} - #{viewfilm[:duratation]} min). - Link: #{viewfilm[:link]}" 
  
  puts
  puts
end
