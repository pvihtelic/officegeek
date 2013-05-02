class CreateTranscripts < ActiveRecord::Migration
  def change
    create_table :transcripts do |t|
      t.integer :topic_id
      t.text :content

      t.timestamps
    end
  end
end
