class Order < ApplicationRecord
  include ActiveModel::Validations
  before_validation :set_total!
  validate_with EnoughProductsValidator
  belongs_to :user
  validates :total, numericality: { greater_than_or_equal_to: 0 }
  validates :total, presence: true
  has_many :placements, dependent: :destroy
  has_many :products, through: :placements

  def set_total
    self.total = self.placements.map { |placement| placement.product.price * placement.quantity }.sum
  end
end
