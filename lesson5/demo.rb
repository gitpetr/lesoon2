require 'csv' 
require 'ostruct'
require 'date'
require_relative 'movie_collection'
TITRES = %i[link name  year country date  genre duratation rating director actors]
require_relative 'movie'
MANTH = %i[Январь Февраль Март Апрель Май Июнь Июль Август Сентябрь Октябрь Ноябрь Декабрь]

@films = ARGV[0] || "./movies.txt"
listfilms =  MovieCollection.new(@films)

puts "\t список всех фильмов(listfilms.all)"
listfilms.all.first(5).each_with_index {|view, c | listfilms.to_s(view, c)   }
puts
puts "\t - Список фильмов.(listfilms.sortby(:name)) Показаны названия первых пяти "
listfilms.sortby(:year).first(5).each_with_index {|view, c | listfilms.to_s(view, c) } 
puts
puts "\t - Список фильмов отсортированных по жанру 'Comedy'"
listfilms.filter(:genre, 'Comedy').first(5).each_with_index {|view, c | listfilms.to_s(view, c) }
puts
puts  
puts "\t - Список фильмов отсортированных по жанру 'Drama' (listfilms.filter(:genre, 'Drama').first(5)) "
listfilms.filter(:genre, 'Drama').first(5).each_with_index {|view, c | listfilms.to_s(view, c) }
puts
puts "\t - Список отсортированный по жанру 'Romance' "
listfilms.filter(:genre, 'Romance').first(5).each_with_index {|view, c | listfilms.to_s(view, c)   }
puts
puts "\t - Статистика по дате"
listfilms.stats(:date).each{|k, v| listfilms.print_stats(k, v.count) }
puts
puts "\t - Список актеров ( [6] )"
print "\t ", listfilms.actors[6]  
puts
puts
puts "\t - Cписок  режиссёров:"
listfilms.stats(:director).first(5).each{|k, v| listfilms.print_stats(k, v) }
puts
puts "\t - Cписок   по  годам"
listfilms.stats(:year).first(5).each{|k, v|  listfilms.print_stats(k, v)  }
puts
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
puts listfilms.genres
puts
puts "Фильтр 'listfilms.filtr(year: 1942..1949, :genre => 'Film-Noir').first(5).each_with_index {|view, c | listfilms.to_s(view, c) }'"
listfilms.filtr(year: 1942..1949, genre: 'Film-Noir').first(5).each_with_index {|view, c | listfilms.to_s(view, c) }