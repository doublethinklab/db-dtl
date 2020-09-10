class CreateDocumentLexicalCategoryCounts < ActiveRecord::Migration[6.0]
  def change
    create_table :document_lexical_category_counts do |t|
      t.string :uuid
      t.string :lexical_category
      t.integer :count

      t.timestamps
    end
    add_index :document_lexical_category_counts, :uuid
  end
end
