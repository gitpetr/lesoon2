if ARGV.length > 0
  films = ARGV[0]
else
  films = "movies.txt"
end

allfilms = File.readlines(films)  
allfilms.map!{|i| i.split("|")}

allfilms.each do |film|
  print film[1], ' ' 
  film[7][-1].to_i.times { print '*' } 
  puts
end
