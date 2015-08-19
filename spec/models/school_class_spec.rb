require 'rails_helper'

RSpec.describe SchoolClass, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:school_class)).to be_valid
  end

  it 'is invalid without a grade' do
    expect(FactoryGirl.build(:school_class, grade: nil)).to_not be_valid
  end

  it 'is invalid without a letter' do
    expect(FactoryGirl.build(:school_class, letter: nil)).to_not be_valid
  end

  it 'returns a full class name as a string' do
    school_class = FactoryGirl.create(:school_class, grade: 1, letter: 'A')

    expect(school_class.name).to eq('IA')
  end
end
