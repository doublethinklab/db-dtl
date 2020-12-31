class AddUsageToApiuser < ActiveRecord::Migration[6.0]
  def change
    add_column :apiusers, :usage, :integer, default: 0
  end
end
