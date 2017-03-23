if ARGV.length > 0
  films = ARGV[0]
else
  films = "movies.txt"
end

if File.exist?(films)

  allfilms = File.readlines(films)  
  allfilms.map!{|i| i.split("|")}

  allfilms.each do |film|
    if film[1].include?("Max")
      print film[1], " "
      stars = film[7].to_f * 10 - 80
      print '*' * stars
      puts
    end
  end
else
  puts "Такого файла не существует"
end
