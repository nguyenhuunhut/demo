class CreateRegisters < ActiveRecord::Migration
  def change
    create_table :registers do |t|
      t.belongs_to :user
      t.belongs_to :classroom
      t.belongs_to :course
      t.boolean :is_register, default: false
      t.boolean :is_pay, default: false
      t.timestamps null: false
    end
  end
end
