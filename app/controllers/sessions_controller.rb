class SessionsController < ApplicationController

  def new
    redirect_to '/auth/facebook'
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'],
                      :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
    reset_session
    session[:user_id] = user.id
    redirect_to root_url, :notice => 'Вы вошли в систему!'
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => 'Вы вышли из системы!'
  end

  def failure
    redirect_to root_url, :alert => "Ошибка аутентификации: #{params[:message].humanize}"
  end

end
