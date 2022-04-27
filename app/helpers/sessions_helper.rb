module SessionsHelper
def user_sign_in?
  session[:redoing] != nil
end

  def current_user
    if session[:redoing]
      User.find(session[:redoing])
    else
      nil
    end
  end

end
