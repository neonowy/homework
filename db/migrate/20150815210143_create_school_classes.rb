class CreateSchoolClasses < ActiveRecord::Migration
  def change
    create_table :school_classes do |t|
      t.integer :grade
      t.string :letter

      t.timestamps null: false
    end
  end
end
