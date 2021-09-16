class CreateReserves < ActiveRecord::Migration[6.0]
  def change
    create_table :reserves do |t|
      t.integer    :quantity , null: false
      t.text       :message  , null: false
      t.string     :honorific, null: false
      t.string     :use_case , null: false
      t.references :customer , null: false, foreign_key: true
      t.references :item     , null: false, foreign_key: true
      t.references :cart     , null: false, foreign_key: true
      t.timestamps
    end
  end
end
