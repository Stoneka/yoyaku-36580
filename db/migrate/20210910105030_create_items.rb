class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item_name, null: false
      t.text :explanation, null: false
      t.integer :size_id , null: false
      t.integer :price   , null: false
      t.integer :calorie , null: false
      t.integer :protein , null: false
      t.integer :fat     , null: false
      t.integer :salt    , null: false
      t.integer :carb    , null: false
      t.timestamps
    end
  end
end
