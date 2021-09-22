class Order < ApplicationRecord
  belongs_to :reserve, optional: true
  has_one :request
end
