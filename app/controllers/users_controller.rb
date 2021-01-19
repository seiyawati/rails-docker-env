class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      # 下と同義redirect_to user_url(@user)
      redirect_to @user
    else
      render 'new'
    end
  end

  private
    # 適切に初期化したハッシュを返すparams[:user]のセキュリティ強化
    def user_params
      params.require(:user).permit(:name, :email, :password,
        :password_confirmation)
    end
end
