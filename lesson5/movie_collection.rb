class MovieCollection 

  def initialize filmfile
    if filmsexists? { File.exist?(filmfile)}
       @films = filmfile
    else
      abort " Такого файла не существует"
    end
  end

  def printfilms( view, count )
    puts("\t#{count + 1}. #{view[:name]}: #{view[:director]} (#{view[:year]}, #{view[:genre].split(',').join('/')} - #{view[:duratation]}).")
  end

  def to_s films
    films.each_with_index {|viewfilm, c| printfilms( viewfilm, c )}
  end

  def allfilms
    CSV.read(@films, col_sep: '|', headers: TITRES ).map {|f|  f.to_h}.map {|film| OpenStruct.new(film)}
  end

  def sortby (field)
      allfilms.sort_by {|f| f[field]} 
  end


  def filter(name, incl)
    allfilms.select{ |f| f[name].include?(incl)}
  end

 

    def stats(field)
      if field == :date
        manth = allfilms.sort_by {|f| f[:date][5..6].to_i }.group_by { |f| Date.parse(f[:date]).strftime("%B") if f[:date].length == 10}
        manth.each{|k, v| puts "\t#{k.ljust(15)} #{v.count}" if k }
      elsif field == :actors
        allfilms.map {|f| f[:actors].split(',').each{|a| a } }.flatten.sort.inject(Hash.new(0)){|h, e| h[e]+=1; h }
      end
    end

  protected

  def filmsexists?
    yield
  end
end

