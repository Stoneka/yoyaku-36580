class Request < ApplicationRecord
  belongs_to :order, optional: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :visit_time
end
