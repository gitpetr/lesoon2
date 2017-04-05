require 'csv' 
require 'ostruct'
require 'date'
require_relative 'movie_collection'
TITRES = %i[link name  year country date  genre duratation rating director actors]
require_relative 'movie'
MANTH = %i[Январь Февраль Март Апрель Май Июнь Июль Август Сентябрь Октябрь Ноябрь Декабрь]

@films = ARGV[0] || "./movies.txt"
listfilms =  MovieCollection.new(@films)

puts "\t - Список всех фильмов(listfilms.all)"
listfilms.all.first(5).each{|f| f.to_s }
puts
puts "\t - Список фильмов.(listfilms.sortby(:year)) Показаны названия первых пяти "
listfilms.sortby(:year).first(5).each{|f| f.to_s } 
puts
puts "\t - Список актеров ( [6] )"
print "\t ", listfilms.actors[6]  
puts
puts
puts "\t - Cтатистика режиссёров:"
listfilms.stats(:director).sort.first(5).each{|k, v| listfilms.print_stats(k, v) }
puts "\t - Cтатистика актеров:"
listfilms.stats(:actors).sort.first(5).each{|k, v| listfilms.print_stats(k, v) }
puts
puts "\t - Cтатистика по годам"
listfilms.stats(:year).first(5).sort.each{|k, v|  listfilms.print_stats(k, v)  }
puts
puts "\t - Статистика по месяцам"
listfilms.stats(:month).each{|k, v| print(k, " - ", v, "\n" ) }
begin
puts("\t - Жанр фильма?")  
puts "\t listfilms.all.first.has_genre? 'Comedy' "
puts (listfilms.all.first.has_genre? 'Comedy')?  ("Yes") :  ("No")
puts "\t listfilms.all[154].has_genre? 'Comedy'"
puts (listfilms.all[154].has_genre? 'Comedy')?  "Yes" : "No"
puts "\t listfilms.all.first.has_genre? 'Drama'"
puts (listfilms.all.first.has_genre? 'Drama')?  "Yes" : "No"
puts "\t listfilms.all[3].has_genre? 'Drama'"
puts (listfilms.all[3].has_genre? 'Drama')?  "Yes" : "No"
puts "\t Если ошиблись с жанром listfilms.all[3].has_genre? 'Boevik'"
puts (listfilms.all[3].has_genre? 'Boevik')?  "Yes" : "No"
rescue Exception => e 
  puts "\t#{e.message}"
end
puts "\t Список жанров"
puts listfilms.genries
puts
puts " - Фильтр listfilms.filtr(year: 1942..1949, genre: 'Film-Noir').first(5).each{|f| f.to_s }"
listfilms.filtr(year: 1942..1949, genre: 'Film-Noir').first(5).each{|f| f.to_s }
puts  
puts " - Фильтр listfilms.filtr(year: 1942..2016, actors: 'Uma Thurman').first(5).each{|f| f.to_s }"
listfilms.filtr(year: 1942..2016, actors: 'Uma Thurman').first(5).each{|f| f.to_s }
