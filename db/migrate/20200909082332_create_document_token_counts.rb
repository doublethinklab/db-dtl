class CreateDocumentTokenCounts < ActiveRecord::Migration[6.0]
  def change
    create_table :document_token_counts do |t|
      t.string :uuid
      t.string :token
      t.integer :count

      t.timestamps
    end
    add_index :document_token_counts, :uuid
  end
end
