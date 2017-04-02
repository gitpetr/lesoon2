require 'csv' 
require 'ostruct'
require 'date'
require_relative 'movie_collection'
#include MovieCollection 

TITRES = %i[link name  year country date  genre duratation rating director actors]
require_relative 'movie'
MANTH = %i[Январь Февраль Март Апрель Май Июнь Июль Август Сентябрь Октябрь Ноябрь Декабрь]

@films = ARGV[0] || "./movies.txt"
listfilms =  MovieCollection.new(@films)
puts "\t список всех фильмов(listfilms.all)"
listfilms.all
puts
puts "\t - Список фильмов.(listfilms.sortby(:name)) Показаны названия первых пяти "
listfilms.sortby(:name).first(5)
puts
puts "\t - Список фильмов отсортированных по жанру 'Comedy' (listfilms.filter(:genre, 'Comedy').first(5)) "
listfilms.filter(:genre, 'Comedy')
puts  
puts "\t - Список фильмов отсортированных по жанру 'Drama' (listfilms.filter(:genre, 'Drama').first(5)) "
listfilms.filter(:genre, 'Drama')
puts
puts "\t - Список отсортированный по жанру 'Romance' "
listfilms.filter(:genre, 'Romance')
puts
puts "\t - Актеры, снявшиеся более, чем в 5 фильмах(listfilms.stats(:actors)"
listfilms.stats(:actors)
puts  
puts "\t - Статистика по дате"
listfilms.stats(:date)
puts
puts "\t - Список актеров (listfilms.movie[3].actors)"
print "\t ", listfilms.movie[3].actors
puts
puts
puts "\t - Cписок  режиссёров по алфавиту снявших более 5 фильмов:"
listfilms.stats(:director)
puts
puts "\t - Cписок   по  годам, снято более 5 фильмов:"
listfilms.stats(:year)
puts
puts("\t - Жанр фильма?")  
puts "\t listfilms.movie.first.has_genre? 'Comedy' "
listfilms.movie.first.has_genre? 'Comedy'
puts "\t listfilms.movie[154].has_genre? 'Comedy'"
listfilms.movie[154].has_genre? 'Comedy'
puts "\t listfilms.movie.first.has_genre? 'Drama'"
listfilms.movie.first.has_genre? 'Drama'
puts "\t listfilms.movie[3].has_genre? 'Drama'"
listfilms.movie[3].has_genre? 'Drama'