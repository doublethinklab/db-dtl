class CreateApiusers < ActiveRecord::Migration[6.0]
  def change
    create_table :apiusers do |t|
      t.string :name
      t.string :mail
      t.string :token
      t.string :note

      t.timestamps
    end
  end
end
