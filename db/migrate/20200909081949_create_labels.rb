class CreateLabels < ActiveRecord::Migration[6.0]
  def change
    create_table :labels do |t|
      t.string :uuid
      t.string :tag
      t.string :domain
      t.string :channel_id
      t.string :creator_id

      t.timestamps
    end
  end
end
