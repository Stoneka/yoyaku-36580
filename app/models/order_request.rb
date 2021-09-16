class OrderRequest
  include ActiveModel::Model
  attr_accessor :reserve_id, :visit_date, :visit_time_id, :order_id

  with_options presence: true do
    validates :reserve_id
    validates :visit_date
    validates :visit_time_id, numericality: {other_than: 1, message: "を入力してください"}
    validates :order_id
  end