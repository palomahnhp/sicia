require 'faker'

module Faker
  class NIF
    class << self
      def nif()
        number = Faker::Number.number(8).to_i
        "#{number}#{nif_letter(number)}"
      end

      def nie()
        available_letters = [:X, :Y]
        first_letter = available_letters.sample
        first_letter_value = available_letters.index(first_letter)
        number_part = Faker::Number.number(7)
        number_for_calculation = "#{first_letter_value}#{number_part}".to_i
        "#{first_letter}#{number_part}#{nif_letter(number_for_calculation)}"
      end

      def cif()
        available_letters = [:A, :B, :C, :D, :E, :F,:G, :H, :J, :N, :P, :Q, :R, :S, :U, :V,:W]
        first_letter = available_letters.sample
        first_letter_value = available_letters.index(first_letter)
        number_part = Faker::Number.number(8)
        number_for_calculation = "#{first_letter_value}#{number_part}".to_i
        "#{first_letter}#{number_part}#{nif_letter(number_for_calculation)}"
      end

      private
        def nif_letter(number)
          nif_seq = 'TRWAGMYFPDXBNJZSQVHLCKE'
          nif_seq[number % nif_seq.length]
        end
    end
  end
end