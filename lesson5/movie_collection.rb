class MovieCollection 
  
  attr_reader :allfilms
  
  def initialize filmfile
    unless File.exist?(filmfile)  
      abort " Такого файла не существует"
    end
    @allfilms = CSV.read(filmfile, col_sep: '|', headers: TITRES ).map{ |f| Movie.new(self, f.to_h) }
  end

  def all
     @allfilms
  end

  def sortby (name)
    @allfilms.sort_by(&:name) 
  end

  def actors
    @allfilms.map {|f|  f.actors }
  end

  def filter(name, incl)
    @allfilms.select{ |f| f.send(name).include?(incl)} 
  end

  def filtr(**options)
   year, genre =  options.keys
   years_list = options[year]
   genres_list = options[genre]
   @allfilms.select{ |f| years_list.member?(f.send(year).to_i)}.select{|f| f.send(genre).include?(genres_list)} 
  end

  def stats(field)
    if field == :date
      @allfilms.sort_by {|f| f.date[5..6].to_i }.group_by { |f| Date.parse(f.date).strftime("%B") if f.date.length == 10}.select{|k, v| k}
    elsif field == :actors
      @allfilms.map {|f| f.actors.each{|a| a } }.flatten.sort.inject(Hash.new(0)){|h, e| h[e]+=1; h }
    else 
      @allfilms.map {|f| f.send(field) }.sort.inject(Hash.new(0)){|h, e| h[e]+=1; h }  
    end
  end

  def print_stats k, v
    puts "\t#{k.ljust(15)} #{v}"
  end

  def genres
    all.flat_map{ |f| f.genre.each{ |g| g }  }.uniq.sort
  end
 
  def to_s view, c
    puts "#{ c + 1 } #{view.name}: #{view.director} ( #{view.year}, #{view.genre.join('/')} - #{view.duratation})."
  end
end
