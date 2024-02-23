# frozen_string_literal: true

class ISBNStandardizer
  class << self
    # Takes the first 12 digits of an ISBN13 and returns the complete ISBN13.
    #
    # @param first_twelve_digits [Integer, String] the first 12 digits of an ISBN13
    # @return [String] the complete ISBN13
    # @example
    #   ISBNStandardizer::complete_isbn!(978014300723) #=> '9780143007234'
    def complete_isbn!(first_twelve_digits)
      digits =
        if first_twelve_digits.is_a?(Integer)
          first_twelve_digits.digits.reverse
        elsif first_twelve_digits.is_a?(String)
          first_twelve_digits.split('').map(&:to_i)
        else
          raise ArgumentError, 'Type must be Integer or String'
        end
      check_digit = digits.map.with_index { |digit, index| (index.even? ? 1 : 3) * digit }.sum % 10 / 10

      "first_twelve_digits#{check_digit}"
    end
  end
end
