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
    yes = @genre.include?(genre)
    puts "\tYes" if yes
  raise  "\tNo" if !yes
  rescue Exception => e 
   puts e.message
  end

end
