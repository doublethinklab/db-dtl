class CreateTwitters < ActiveRecord::Migration[6.0]
  def change
    create_table :twitters do |t|
      t.string :creator_id
      t.string :source

      t.timestamps
    end
  end
end
