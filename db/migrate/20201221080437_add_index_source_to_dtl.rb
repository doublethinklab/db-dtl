class AddIndexSourceToDtl < ActiveRecord::Migration[6.0]
  def change
    add_index :dtls, :source
  end
end
