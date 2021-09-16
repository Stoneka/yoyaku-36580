class Order < ApplicationRecord
  belongs_to: reserve
  has_one: request
end
