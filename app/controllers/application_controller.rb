class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  helper_method :user_signed_in?, :current_user

  private

  def record_not_found
    render file: "public/404.html", status: 404
  end
  
  def user_signed_in?
    session[:redoing] != nil
  end

  def current_user
    if user_signed_in?
      User.find(session[:redoing])
    else
      nil
    end
  end

  def check_login!
    if not user_signed_in?
      redirect_to "/users/sign_in"
    end
  end
end
