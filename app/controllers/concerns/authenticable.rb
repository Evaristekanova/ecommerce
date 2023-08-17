module Authenticable
    def current_user
        return current_user  if current_user
        header = request.headers['Authorization']
        return nil if header.nil?
        token = header.split(' ').last if header

        decoded = JsonWebToken.decode(token)
        @current_user = User.find(decoded[:user_id])
        if current_user.nil?
            render json: {error: "unauthorized"}, status: :unauthorized
        end
    end
end