class SessionsController < ApplicationController

  def create
    # 驗證 email & password
    pw = user_params[:password]
    salted_pw = "eiojre#{pw}rewropwr"
    hashed_password = Digest::SHA1.hexdigest(salted_pw)

    user = User.find_by(email: user_params[:email],
                        password: hashed_password)

    if user
      session[:redoing] = user.id
      redirect_to "/"
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:redoing] = nil
    redirect_to "/"
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password)
  end

end
