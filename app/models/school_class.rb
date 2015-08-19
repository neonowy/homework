class SchoolClass < ActiveRecord::Base
  validates :grade, length: { is: 1 }
  validates :letter, length: { is: 1 }
end
