class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    debugger
    User.create(user_params)
    redirect_to root_path, notice: 'Вы успешно зарегистрировались!'
  end

  private

  def user_params
    params.require(:user).permit(:name, :nickname, :email, :password)
  end
end
