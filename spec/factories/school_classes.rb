require 'faker'

FactoryGirl.define do
  factory :school_class do |f|
    f.grade { Faker::Number.between(1, 6) }
    f.letter { ('A'..'Z').to_a.sample }
  end
end
