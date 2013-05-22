class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :titel
      t.text :vraag

      t.timestamps
    end
  end
end
