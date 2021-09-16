class Reserve < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  belongs_to :cart
  has_one :order
end
