films = ARGV[0] || "movies.txt"

if File.exist?(films) == false
  abort "Такого файла не существует"
end

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
 
