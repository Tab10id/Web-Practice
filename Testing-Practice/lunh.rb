class CardChecker
  #attr_reader :number
  #def init (number)
  #  @number = number
  #end
  def Algorithm(number)
    number
        .reverse
        .delete(" ")
        .chars
        .map.with_index {|elem,i| i%2 == 1 ? elem.to_i*2 : elem.to_i}
        .map {|elem| elem>9 ? elem-9 : elem}
        .inject(0){ |result, elem| result + elem } % 10 === 0
  end
end

class CardCheckerMock
  attr_reader :arg
  class << self
    def Algorithm(arg)
      puts arg
      true
    end
  end
end

puts CardCheckerMock.Algorithm("12345")
puts CardChecker.new.Algorithm("4561261212345464")
puts CardChecker.new.Algorithm("4561261212345467")
puts CardChecker.new.Algorithm("4561 2612 1234 5467")