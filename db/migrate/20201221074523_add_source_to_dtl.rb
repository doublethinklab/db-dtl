class AddSourceToDtl < ActiveRecord::Migration[6.0]
  def change
    add_column :dtls, :original_source_name, :string
    add_column :dtls, :original_source_url, :string
    add_column :dtls, :original_source_check, :string
    add_index :dtls, :original_source_name
    add_index :dtls, :original_source_check
  end
end
