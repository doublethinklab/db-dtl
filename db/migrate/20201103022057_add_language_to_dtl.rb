class AddLanguageToDtl < ActiveRecord::Migration[6.0]
  def change
    add_column :dtls, :language, :string
  end
end
