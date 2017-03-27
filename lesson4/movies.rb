require 'csv' 
require 'ostruct'
require 'date'

TITRES = %i[link name date country year genre duratation rating director actors]
MANTH = %i[Январь Февраль Март Апрель Май Июнь Июль Август Сентябрь Октябрь Ноябрь Декабрь]

def printfilms( view, count )
   puts("\t#{count + 1}. #{view[:name]}: #{view[:director]} (#{view[:year]}, \
#{view[:genre].split(',').join('/')} - #{view[:duratation]}).")
end

films = ARGV[0] || "../movies.txt"

unless File.exist?(films)  
  abort " Такого файла не существует"
end

allfilms = CSV.read(films, col_sep: '|').map! { |ln| TITRES.zip(ln).to_h}
allfilms.map! {|film| OpenStruct.new(film)}

director = allfilms.map { |film| film[:director].split(" ").last }.uniq.sort
manth = allfilms.map { |f| [f[:year][5..6]]}

 
puts
puts "\t 5 самых длинных фильмов:"
puts

allfilms.sort_by { 
  |hsh| hsh[:duratation].split(" ")[0].to_i }.reverse.first(5).each_with_index { 
  |viewfilm, c| printfilms( viewfilm, c )}

puts
puts
puts "\t 10 комедий (первые по дате выхода):"
puts
 
allfilms.select{ |v| v[:genre].include?('Comedy')  }.sort_by {
                 |hsh| hsh[:date] }.first(10).each_with_index {
                 |viewfilm, c| printfilms( viewfilm, c )}     
puts
puts
puts "\t список всех режиссёров по алфавиту:"

 
director.each_slice(6){|viewfilm|
                         puts 
                         viewfilm.each{|name| print "\t#{name}".ljust(15)}}

puts 
puts
print "\t количество фильмов, снятых не в США: "
puts allfilms.select{ |f| !f[:country].include?("USA")}.count
puts 

puts "\t Статистика по месяцам: "
puts

statistics = MANTH.zip([manth.count(['01']), manth.count(['02']), manth.count(['03']), manth.count(['04']), manth.count(['05']), manth.count(['06']), manth.count(['07']),\
 manth.count(['08']), manth.count(['09']),  manth.count(['10']), manth.count(['11']), manth.count(['12']) ]).to_h
statistics.each{ |k, v| print "\t #{k}:".ljust(15); puts "#{v} фильмов"}
