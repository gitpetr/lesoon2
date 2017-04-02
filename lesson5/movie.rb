class Movie
  attr_reader *TITRES 
 
  def initialize film
    @link = film[:link]
    @name = film[:name]
    @year = film[:year]
    @country = film[:country].split(',')
    @date = film[:date]
    @genre = film[:genre]
    @duratation = film[:duratation]
    @rating = film[:rating]
    @director = film[:director] 
    @actors = film[:actors].split(',')
  end

  def has_genre? genre 
  raise  "Извините! Вы ошиблись, такого жанра нет" if !GENRE.include?(genre)
   
    yes = @genre.include?(genre)
    if yes
      puts "\tYes" 
    else
      puts "\tNo"
    end

  rescue Exception => e 
    puts "\t#{e.message}"
  end
end
