require 'rails_helper'

RSpec.describe "school_classes/new.html.erb", type: :view do
  before do
    school_class = SchoolClass.new

    assign(:school_class, school_class)
    render
  end

  it 'displays a field to enter a grade' do
    expect(rendered).to have_selector('input[type=number]')
  end

  it 'displays a field to enter a letter' do
    expect(rendered).to have_selector('input[type=text]')
  end

  it 'displays a submit button' do
    expect(rendered).to have_selector('input[type=submit]')
  end
end
