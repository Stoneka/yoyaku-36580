class Cart < ApplicationRecord
  belongs_to :customer, optional: true
end
