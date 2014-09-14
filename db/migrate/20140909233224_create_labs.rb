class CreateLabs < ActiveRecord::Migration
  def change
    create_table :labs do |t|
      t.belongs_to :creator, index: true
      t.string :name
      t.text :description
      t.string :workflow_state, index: true, null: false
      t.timestamps null: false
    end
  end
end
