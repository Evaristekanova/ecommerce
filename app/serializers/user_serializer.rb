class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :updated_at, :created_at
end
