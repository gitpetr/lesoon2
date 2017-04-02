class MovieCollection 
  
  attr_reader :allfilms
  
  def initialize filmfile
    unless File.exist?(filmfile)  
      abort " Такого файла не существует"
    end
    @allfilms = CSV.read(filmfile, col_sep: '|', headers: TITRES ).map {|f|  f.to_h}.map {|film| OpenStruct.new(film)}
  end

  def all
    to_s @allfilms
  end

  def sortby (field)
      to_s @allfilms.sort_by {|f| f[field]}.first(5) 
  end

  def movie
    @allfilms.map { |f| Movie.new(f) }
  end

  def filter(name, incl)
    to_s @allfilms.select{ |f| f[name].include?(incl)}.first(5)
  end

  def stats(field)
    if field == :date
      manth = @allfilms.sort_by {|f| f[:date][5..6].to_i }.group_by { |f| Date.parse(f[:date]).strftime("%B") if f[:date].length == 10}
      manth.each{|k, v| puts "\t#{k.ljust(15)} #{v.count}" if k }
    elsif field == :actors
      date = @allfilms.map {|f| f[:actors].split(',').each{|a| a } }.flatten.sort.inject(Hash.new(0)){|h, e| h[e]+=1; h }
      date.each{|k, v| puts "\t#{k.ljust(15)} #{v}" if v > 5 }
    else 
      @allfilms.map {|f| f[field] }.sort.inject(Hash.new(0)){|h, e| h[e]+=1; h }.each{|k, v| puts "\t#{k.ljust(15)} #{v}"  if v > 5 }
    end
  end

  
protected

  def printfilms( view, count )
    puts("\t#{count + 1}. #{view[:name]}: #{view[:director]} (#{view[:year]}, #{view[:genre].split(',').join('/')} - #{view[:duratation]}).")
  end

  def to_s films
    films.each_with_index {|viewfilm, c| printfilms( viewfilm, c )}
  end

end

