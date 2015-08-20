require 'rails_helper'

RSpec.describe "school_classes/index.html.erb", type: :view do
  context 'when has school classes' do
    it 'displays school classes' do
      assign(:school_classes, [
        FactoryGirl.create(:school_class, grade: 1, letter: 'A'),
        FactoryGirl.create(:school_class, grade: 1, letter: 'B')
      ])

      render

      expect(rendered).to have_link 'IA', href: school_class_path(1)
      expect(rendered).to have_link 'IB', href: school_class_path(2)
    end
  end

  context 'when no school classes' do
    it "displays 'No Classes' info" do
      assign(:school_classes, [])

      render

      expect(rendered).to have_content 'No Classes'
      expect(rendered).to have_content 'Maybe you'
      expect(rendered).to have_link 'create one', href: new_school_class_path
    end
  end
end
