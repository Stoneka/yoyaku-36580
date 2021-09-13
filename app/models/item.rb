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
  with_options presence: true, numericality: true do
    validates :price
    validates :calorie
    validates :protein
    validates :fat
    validates :salt
    validates :carb
  end
end
