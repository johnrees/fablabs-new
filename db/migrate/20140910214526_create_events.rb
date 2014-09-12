class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :creator, index: true
      t.string :name
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :workflow_state

      t.timestamps null: false
    end
    add_index :events, :workflow_state
  end
end
