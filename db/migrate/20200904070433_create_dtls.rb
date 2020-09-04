class CreateDtls < ActiveRecord::Migration[6.0]
  def change
    create_table :dtls do |t|
      t.string :source
      t.uuid :uuid
      t.string :url
      t.string :platform_id
      t.string :link
      t.string :domain
      t.string :channel_id
      t.string :channel_name
      t.string :creator_id
      t.string :creator_name
      t.string :title
      t.string :description
      t.text :content
      t.jsonb :media_meta
      t.jsonb :system_meta
      t.datetime :pub_time

      t.timestamps
    end
  end
end


