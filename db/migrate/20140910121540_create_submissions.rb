class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.belongs_to :creator
      t.belongs_to :lab
      t.string :workflow_state
      t.text :notes

      t.timestamps null: false
    end
    add_index :submissions, [:creator_id, :lab_id], unique: true
  end
end
