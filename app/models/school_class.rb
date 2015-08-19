class SchoolClass < ActiveRecord::Base
  validates :grade, length: { is: 1 }
  validates :letter, length: { is: 1 }

  def name
    roman_grade = RomanNumerals.to_roman(grade)

    roman_grade + letter
  end
end
