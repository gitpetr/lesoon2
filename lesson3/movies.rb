TITRES = [:link, :name, :date, :country, :year, :genre, :duratation, :rating, :director, :actors]

films = ARGV[0] || "../movies.txt"
def printfilms( view, count )
   puts("\t#{count + 1}. #{view[:name]}: #{view[:director]} (#{view[:year]}, \
    #{view[:genre].split(',').join('/')} - #{view[:duratation]}).")
end

unless File.exist?(films)  
  abort " Такого файла не существует"
end

allfilms = File.readlines(films) 
allfilms.map!{|i| i.chomp.split("|")}
puts; puts "\t 5 самых длинных фильмов:"; puts

allfilms.map { |film| Hash[TITRES.zip(film)] }.sort_by { 
  |hsh| hsh[:duratation].split(" ")[0].to_i }.reverse[0...5].each_with_index { 
  |viewfilm, c| printfilms( viewfilm, c )}

puts; puts; puts "\t 10 комедий (первые по дате выхода):"; puts

allfilms.select{ |f| f[5].scan(/Comedy/).include?('Comedy')
                }.map { |film| Hash[TITRES.zip(film)] 
                }.sort_by { |hsh| hsh[:date] }[0...10].each_with_index {
                |viewfilm, c| printfilms( viewfilm, c )}

puts;  puts;  puts "\t список всех режиссёров по алфавиту:"; puts

allfilms.map { |film| { director: film[8] }}.uniq.sort_by {|hsh| hsh[:director].split(" ").last 
              }.each_slice(10){|viewfilm| puts; viewfilm.each {
              |viewfilm| print "\t#{viewfilm[:director].split(" ").last} #{" " * (12 - (viewfilm[:director].split(" ").last.length))}"
              } } 
puts; puts; print "\tколичество фильмов, снятых не в США: "
puts allfilms.select{ |f| !f[3].scan(/USA/).include?("USA")}.count; puts 
