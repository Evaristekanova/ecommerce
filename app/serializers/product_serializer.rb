class ProductSerializer
  include FastJsonapi::ObjectSerializer
  attributes :tittle, :price, :published
  belongs_to :user
end
