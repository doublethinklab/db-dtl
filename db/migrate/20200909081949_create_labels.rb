class CreateLabels < ActiveRecord::Migration[6.0]
  def change
    create_table :labels do |t|
      t.string :uuid
      t.string :name
      t.string :domain
      t.string :channel_id
      t.string :creator_id

      t.timestamps
    end
    
    add_index :labels, :uuid
    add_index :labels, :name
    add_index :labels, :domain
    add_index :labels, :channel_id
    add_index :labels, :creator_id
  end
end
