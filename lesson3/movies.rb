films = ARGV[0] || "../movies.txt"

unless File.exist?(films)  
  abort "Такого файла не существует"
end

allfilms = File.readlines(films)  
allfilms.map!{|i| i.split("|")}

puts "5 самых длинных фильмов:"
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
              end.sort_by { |hsh| hsh[:duratation].split(" ")[0].to_i }.reverse[0...5].each_with_index do |viewfilm, c|              
  print "#{c + 1}. #{viewfilm[:name]}: #{viewfilm[:director]} (#{viewfilm[:year]},  #{viewfilm[:genre].split(',').join('/')} - #{viewfilm[:duratation]})." 
  puts
  puts
end
puts "10 комедий (первые по дате выхода):"

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
  print print "#{c + 1}. #{viewfilm[:name]}: #{viewfilm[:director]} (#{viewfilm[:year]},  #{viewfilm[:genre].split(',').join('/')} - #{viewfilm[:duratation]})." 
  puts
  puts
end

puts "список всех режиссёров по алфавиту:"

allfilms.map do |film| {director: film[8] 
                        }
              end.uniq.sort_by { |hsh| hsh[:director].split(" ").last }.each_with_index do |viewfilm, c|

  print "#{c + 1}. #{viewfilm[:director].split(" ").last} ", " " 
  if (c + 1) % 10 == 0 
    puts 
  end
  
end
puts
print "количество фильмов, снятых не в США: "
puts allfilms.select{ |f| !f[3].include?("USA")}.count 