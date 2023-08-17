class Order < ApplicationRecord
  belongs_to :user
  validates :total, numerically: { greater_than_or_equal_to: 0 }
  validates :total, presence :true
end
