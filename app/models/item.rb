class Item < ApplicationRecord
  has_one_attached :image
  has_many :reserves

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :size
  with_options presence: true do
    validates :image
    validates :item_name
    validates :explanation
    validates :size_id, numericality: { other_than: 1 }
  end
  with_options presence: true do
    validates :price, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 99_999 }
    validates :calorie, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999 }
    validates :protein, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999 }
    validates :fat, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999 }
    validates :salt, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999 }
    validates :carb, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9_999 }
  end
end