class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def verify_auth_header
    header = request.headers["Authorization"]
    begin  # "try" block
      removed_basic = header.gsub('Basic ', '')
      auth_header_data = removed_basic.split(":")
    rescue #
      auth_header_data = header.split(":")
    end
    email = Base64.decode64(auth_header_data[0])
    password = Base64.decode64(auth_header_data[1])
    @user = User.find_by_email(email)
    if @user.password_digest == password
    else
      render json: {error: 'Authorization token header invalid'} , status: :unauthorized
    end
  end
end
