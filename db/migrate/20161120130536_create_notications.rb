class CreateNotications < ActiveRecord::Migration
  def change
    create_table :notications do |t|
      t.integer :id_from
      t.integer :id_to
      t.string :content
      t.boolean :status, default: true
      t.timestamps null: false
    end
  end
end
