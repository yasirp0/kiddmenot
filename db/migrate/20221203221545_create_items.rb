class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :description
      t.integer :quantity
      t.string :image
      t.float :price
      t.string :item_name
      t.boolean :available

      t.timestamps
    end
  end
end
