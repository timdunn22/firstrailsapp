class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.string :copy
      t.string :title

      t.timestamps null: false
    end
  end
end
