# frozen_string_literal: true
# CardChecker.valid?('4561261212345464') = false
# CardChecker.valid?('4561261212345467') => true
# https://en.wikipedia.org/wiki/Luhn_algorithm
#
class CardChecker
  attr_reader :card
  def initialize(card)
    @card = card
  end

  def valid?
    (check_numbers.sum % 10).zero?
  end

  private

  def check_numbers
    card_numbers.each_with_object([]).with_index do |(number, result), index|
      result <<
          if index.even?
            even_modification(number)
          else
            number
          end
    end
  end

  def card_numbers
    card.split('').map(&:to_i)
  end

  def even_modification(number)
    modified_number = number * 2
    modified_number -= 9 if modified_number > 9
    modified_number
  end

  class << self
    def valid?(card)
      new(card).valid?
    end
  end
end