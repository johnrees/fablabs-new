class CreateLabs < ActiveRecord::Migration
  def change
    create_table :labs do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
