class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def verify_auth_header
        header = request.headers["Authorization"]
        auth_header_data = header.split(":")
        email = Base64.decode64(auth_header_data[0])
        password = Base64.decode64(auth_header_data[1])
        @user = User.find_by_email(email)
        if @user.password_hash == password
        else
          render json: {error: 'Authorization token header invalid'} , status: :unauthorized
        end
  end
end
