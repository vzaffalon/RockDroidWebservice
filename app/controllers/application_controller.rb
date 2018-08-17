class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def verify_auth_header
    header = request.headers["Authorization"]
    begin  # "try" block
      removed_basic = header.gsub('Basic ', '')
      decoded_basic = Base64.decode64(removed_basic)
      auth_header_data = decoded_basic.split(":")
    rescue #
      auth_header_data = header.split(":")
    end
    email = auth_header_data[0]
    password = auth_header_data[1]
    @user = User.find_by_email(email)
    if @user.password_digest == password
    else
      render json: {error: 'Authorization token header invalid'} , status: :unauthorized
    end
  end
end
