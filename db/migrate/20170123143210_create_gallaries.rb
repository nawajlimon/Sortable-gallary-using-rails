class CreateGallaries < ActiveRecord::Migration[5.0]
  def change
    create_table :gallaries do |t|
      t.string :image
      t.string :alt
      t.integer :priority
      t.timestamps
    end
  end
end
