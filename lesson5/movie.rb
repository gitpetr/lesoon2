class Movie
  attr_reader *TITRES 
 
  def initialize(owner, film)
    @link = film[:link]
    @name = film[:name]
    @year = film[:year]
    @country = film[:country].split(',')
    @date = film[:date]
    @genre = film[:genre].split(',')
    @duratation = film[:duratation]
    @rating = film[:rating]
    @director = film[:director].split(' ').reverse.join(' ') 
    @actors = film[:actors].split(',')
    @collection = owner 
  end

  def has_genre? genre 
     raise  "Извините! Вы ошиблись, такого жанра нет" if !@collection.genres.include?(genre)
     @genre.include?(genre)
  end
end
