require 'csv' 
require 'ostruct'
require 'date'
require_relative 'movie_collection'
TITRES = %i[link name  year country date  genre duratation rating director actors]
require_relative 'movie'
MANTH = %i[Январь Февраль Март Апрель Май Июнь Июль Август Сентябрь Октябрь Ноябрь Декабрь]

@films = ARGV[0] || "./movies.txt"
listfilms =  MovieCollection.new(@films)
GENRE = listfilms.genres
puts "\t список всех фильмов(listfilms.all)"
listfilms.all.each_with_index {|view, c | listfilms.to_s(view, c)   }
puts
puts "\t - Список фильмов.(listfilms.sortby(:name)) Показаны названия первых пяти "
@sortfilm = listfilms.sortby(:year) 
@sortfilm.each_with_index {|view, c | listfilms.to_s(view, c) }
puts
puts "\t - Список фильмов отсортированных по жанру 'Comedy'"
@filtrfilm = listfilms.filter(:genre, 'Comedy')
@filtrfilm.each_with_index {|view, c | listfilms.to_s(view, c) }
puts
puts  
puts "\t - Список фильмов отсортированных по жанру 'Drama' (listfilms.filter(:genre, 'Drama').first(5)) "
@filtrfilm1 = listfilms.filter(:genre, 'Drama')
@filtrfilm1.each_with_index {|view, c | listfilms.to_s(view, c) }
puts
puts "\t - Список отсортированный по жанру 'Romance' "
@filtrfilm2 = listfilms.filter(:genre, 'Romance')
@filtrfilm2.each_with_index {|view, c | listfilms.to_s(view, c)   }
puts
puts "\t - Актеры, снявшиеся более, чем в 5 фильмах(listfilms.stats(:actors)"
listfilms.stats(:actors)
puts  
puts "\t - Статистика по дате"
listfilms.stats(:date)
puts
puts "\t - Список актеров ( [6] )"

print "\t ", listfilms.actors[6]  
puts
puts
puts "\t - Cписок  режиссёров по алфавиту снявших более 5 фильмов:"
listfilms.stats(:director)
puts
puts "\t - Cписок   по  годам, снято более 5 фильмов:"
listfilms.stats(:year)
puts
puts("\t - Жанр фильма?")  
puts "\t listfilms.all.first.has_genre? 'Comedy' "
listfilms.all.first.has_genre? 'Comedy'
puts "\t listfilms.all[154].has_genre? 'Comedy'"
listfilms.all[154].has_genre? 'Comedy'
puts "\t listfilms.all.first.has_genre? 'Drama'"
listfilms.all.first.has_genre? 'Drama'
puts "\t listfilms.all[3].has_genre? 'Drama'"
listfilms.all[3].has_genre? 'Drama'
puts "\t Если ошиблись с жанром listfilms.all[3].has_genre? 'Boevik'"
listfilms.all[3].has_genre? 'Boevik'
