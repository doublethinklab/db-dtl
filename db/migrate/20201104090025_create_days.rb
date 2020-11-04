class CreateDays < ActiveRecord::Migration[6.0]
  def change
    create_table :days do |t|
      t.string :domain
      t.string :channel_id
      t.string :creator_id
      t.string :date
      t.integer :num

      t.timestamps
    end
    add_index :days, :domain
    add_index :days, :channel_id
    add_index :days, :creator_id
    add_index :days, :date
    add_index :days, :num
  end
end
