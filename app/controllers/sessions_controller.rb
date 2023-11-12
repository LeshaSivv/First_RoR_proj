class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:session)

    user = User.find_by(email: user_params[:email])

    if user.present?
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Вы вошли на сайт'
    else
      flash.now[:alert] = 'Неправильный пароль или email'
      redirect_to new_session_path, alert: 'Неправильный пароль или email'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'Вы вышли из аккаунта'
  end
end
