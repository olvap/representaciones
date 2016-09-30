class SessionsController < ApplicationController
  skip_before_action :authenticate_user, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by_email params[:email]
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'Iniciaste sesion correctamente'
    else
      flash.now.alert = 'Email o contraseña incorrecta'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: 'Cerraste sesion'
  end
end
