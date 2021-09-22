class Reserve < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :item, optional: true
  belongs_to :cart, optional: true
  has_one :order
end
