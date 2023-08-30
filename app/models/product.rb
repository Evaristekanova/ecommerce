class Product < ApplicationRecord

  validates :tittle, :user_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, presence: true
  belongs_to :user
  has_many :placements, dependent: :destroy
  has_many :orders, through: :placements

  def self.search(params={})
    product = params[:title] ? Product.where('title LIKE ?', "%#{params[:title]}%") : Product.all
    product = product.where('price >= ?', params[:min_price]) if params[:min_price]
    product = product.where('price <= ?', params[:max_price]) if params[:max_price]
    product
  end

end
