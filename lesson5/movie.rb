class Movie
  attr_reader *TITRES, :manthf
 
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
    @manthf = []
  end

  def has_genre? genre 
     raise  "Извините! Вы ошиблись, такого жанра нет" unless @collection.genries.include?(genre)
     @genre.include?(genre)
  end

  def to_s 
   print "\t #{@name}: #{@director} ( #{@year}, #{@genre.join('/')} - #{@duratation}). \n\b"
  end
  
  def month
    @manthf <<  Date.parse(self.date).strftime("%B") if self.date.length == 10
  end
end
