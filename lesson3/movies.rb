films = ARGV[0] || "../movies.txt"

unless File.exist?(films)  
  abort "Такого файла не существует"
end

allfilms = File.readlines(films)  
allfilms.map!{|i| i.split("|")}
 
allfilms.map do |film| {
                        link: film[0], 
                        name: film[1],
                        date: film[2],
                        country: film[3],
                        year: film[4], 
                        genre: film[5], 
                        duratation:  film[6], 
                        rating: film[7], 
                        director: film[8], 
                        actors: film[9]
                        }
              end.sort_by { |hsh| hsh[:duratation] }.reverse[0...5].each_with_index do |viewfilm, c|
  print "#{c + 1}. #{viewfilm[:name]}: #{viewfilm[:director]} (#{viewfilm[:year]}, #{viewfilm[:actors].chomp}, #{viewfilm[:country]} - #{viewfilm[:duratation]} min). - Link: #{viewfilm[:link]}" 
  puts
  puts
end

allfilms.select{ |f| f[5].split(",").include?("Comedy")}.map do |film| {
                        link: film[0], 
                        name: film[1],
                        date: film[2],
                        country: film[3],
                        year: film[4], 
                        genre: film[5], 
                        duratation:  film[6], 
                        rating: film[7], 
                        director: film[8], 
                        actors: film[9]
                        }
              end.sort_by { |hsh| hsh[:date] }[0...10].each_with_index do |viewfilm, c|
  print "#{c + 1}. #{viewfilm[:name]}: #{viewfilm[:director]} (#{viewfilm[:year]} [#{viewfilm[:genre]}] #{viewfilm[:actors].chomp}, #{viewfilm[:country]} - #{viewfilm[:duratation]} min). - Link: #{viewfilm[:link]}" 
  puts
  puts
end