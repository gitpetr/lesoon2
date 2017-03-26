TITRES = %i[link name date country year genre duratation rating director actors]

films = ARGV[0] || "../movies.txt"
def printfilms( view, count )
   puts("\t#{count + 1}. #{view[:name]}: #{view[:director]} (#{view[:year]}, \
#{view[:genre].split(',').join('/')} - #{view[:duratation]}).")
end

unless File.exist?(films)  
  abort " Такого файла не существует"
end

allfilms = File.readlines(films).map { |ln| TITRES.zip(ln.chomp.split("|")).to_h }
director = allfilms.map { |film| film[:director].split(" ").last }.uniq.sort
 
puts
puts "\t 5 самых длинных фильмов:"
puts

allfilms.sort_by { 
  |hsh| hsh[:duratation].split(" ")[0].to_i }.reverse.first(5).each_with_index { 
  |viewfilm, c| printfilms( viewfilm, c )}

puts
puts
puts "\t 10 комедий (первые по дате выхода):"; puts
 
allfilms.select{ |v| v.to_s.include?('Comedy')  }.sort_by {
                 |hsh| hsh[:date] }.first(10).each_with_index {
                 |viewfilm, c| printfilms( viewfilm, c )}     
puts
puts
puts "\t список всех режиссёров по алфавиту:"
puts
 
director.each_slice(6){|viewfilm|
                         puts 
                         viewfilm.each{|name| print "\t#{name}".ljust(15)}}

puts 
puts
print " количество фильмов, снятых не в США: "
puts allfilms.select{ |f| !f.to_s.include?("USA")}.count
puts 
