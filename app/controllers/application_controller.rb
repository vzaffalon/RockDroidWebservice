class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def verify_auth_header
    header = request.headers["Authorization"]
    removed_basic = header.gsub('Basic ', '')
    auth_header_data = Base64.decode64(removed_basic).split(":")
    email = auth_header_data[0]
    password = auth_header_data[1]
    @user = User.find_by_email(email)
    if @user.password_hash == password
    else
      render json: {error: 'Authorization token header invalid'} , status: :unauthorized
    end
  end
end
