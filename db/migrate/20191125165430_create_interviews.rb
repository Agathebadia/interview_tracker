class CreateInterviews < ActiveRecord::Migration[5.2]
  def change
    create_table :interviews do |t|
      t.references :application, foreign_key: true
      t.datetime :date
      t.text :description

      t.timestamps
    end
  end
end
