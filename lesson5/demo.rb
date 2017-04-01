require 'csv' 
require 'ostruct'
require 'date'
require_relative 'movie_collection'
#include MovieCollection 
TITRES = %i[link name  year country date  genre duratation rating director actors]
MANTH = %i[Январь Февраль Март Апрель Май Июнь Июль Август Сентябрь Октябрь Ноябрь Декабрь]

@films = ARGV[0] || "./movies.txt"
listfilms =  MovieCollection.new(@films)
puts "массив всех фильмов(listfilms =  MovieCollection.new(@films)), показаны первые 3 "
puts listfilms.to_s listfilms.allfilms.first(3)
puts 
puts "Список фильмов.(listfilms.sortby(:name)) Показаны названия первых пяти "
puts  listfilms.to_s listfilms.sortby(:name).first(5)
#listfilms.sortby(:name).first(5).each{ |f| p f[:name] }

puts "Список фильмов отсортированных по жанру 'Comedy' (listfilms.filter(:genre, 'Comedy').first(5)) "
puts listfilms.to_s listfilms.filter(:genre, 'Comedy').first(5)
puts  
puts "Список фильмов отсортированных по жанру 'Drama' (listfilms.filter(:genre, 'Drama').first(5)) "
puts  
puts listfilms.to_s listfilms.filter(:genre, 'Drama').first(5)
#genre = listfilms.stats(:genre)

puts 'Актеры, снявшиеся более, чем в 5 фильмах(listfilms.stats(:actors).each{|k, v| puts "\t#{k.ljust(15)} #{v}" if v > 5 })'

listfilms.stats(:actors).each{|k, v| puts "\t#{k.ljust(15)} #{v}" if v > 5 }

puts  
puts 'Статистика по дате'
listfilms.stats(:date)