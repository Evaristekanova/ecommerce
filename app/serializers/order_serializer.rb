class OrderSerializer
  include FastJsonapi::ObjectSerializer
  belongs_to :user
  has_many :products
  attributes 
  cashe_options enabled: true, cache_length: 12.hours
end
