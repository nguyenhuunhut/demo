class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|

      t.timestamps null: false
      t.string :name
      t.string :subject
      t.integer :total
      t.integer :fee
      t.integer :month
      t.string :schedule
      t.date :start
      t.belongs_to :course
      t.belongs_to :user
    end
  end
end
