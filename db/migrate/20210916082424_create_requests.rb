class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.date       :visit_date    , null: false
      t.integer    :visit_time_id , null: false
      t.references :order         , null: false, foreign_key: true
      t.timestamps
    end
  end
end
