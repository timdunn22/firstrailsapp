class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.text :body
      t.integer :post_id
      t.timestamps null: false
    end
  end
end
