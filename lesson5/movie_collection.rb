class MovieCollection 
  
  attr_reader :allfilms
  
  def initialize filmfile
    unless File.exist?(filmfile)  
      abort " Такого файла не существует"
    end
     @allfilms = CSV.read(filmfile, col_sep: '|', headers: TITRES ).map {|f|  f.to_h}.map{ |f| Movie.new(f) }
  end

  def all
     @allfilms
  end

  def sortby (name)
      @allfilms1 = @allfilms.sort_by {|f|  f.send(name) }.first(5) 
  end

  def actors
    @actors = @allfilms.map {|f|  f.actors }
  end

  def filter(name, incl)
    @allfilms3 = @allfilms.select{ |f| f.send(name).include?(incl)}.first(5)
  end

  def stats(field)
    if field == :date
      manth = @allfilms.sort_by {|f| f.date[5..6].to_i }.group_by { |f| Date.parse(f.date).strftime("%B") if f.date.length == 10}
      manth.each{|k, v| puts "\t#{k.ljust(15)} #{v.count}" if k }
    elsif field == :actors
      date = @allfilms.map {|f| f.actors.each{|a| a } }.flatten.sort.inject(Hash.new(0)){|h, e| h[e]+=1; h }
      date.each{|k, v| puts "\t#{k.ljust(15)} #{v}" if v > 5 }
    else 
      @allfilms.map {|f| f.send(field) }.sort.inject(Hash.new(0)){|h, e| h[e]+=1; h }.each{|k, v| puts "\t#{k.ljust(15)} #{v}"  if v > 5 }
    end
  end

  def genres
    all.map{ |f| f.genre.split(',').each{ |g| g }  }.flatten.uniq.sort
  end

  def to_s view, c
    puts "#{ c + 1 } #{view.name}: #{view.director} ( #{view.year}, #{view.genre.split(',').join('/')} - #{view.duratation})."
  end

end
