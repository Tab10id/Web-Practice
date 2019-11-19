def Algorithm(card_number)
  digits = card_number
               .reverse
               .chars
               .map.with_index {|elem,i| i%2 == 1 ? elem.to_i*2 : elem.to_i}
               .map {|elem| elem>9 ? elem-9 : elem}
               .inject(0){ |result, elem| result + elem } % 10 === 0
  puts digits
end

puts Algorithm("4561261212345464")
puts Algorithm("4561261212345467")
