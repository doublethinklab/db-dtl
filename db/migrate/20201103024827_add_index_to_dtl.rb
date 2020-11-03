class AddIndexToDtl < ActiveRecord::Migration[6.0]
  def change
    add_index :dtls, :language
  end
end
