class AddIndexToDay < ActiveRecord::Migration[6.0]
  def change
    add_index :days, %i[domain creator_id date], unique: true
  end
end
