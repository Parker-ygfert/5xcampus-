class UsersController < ApplicationController

  def sign_up
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      sign_in_user(@user)
      redirect_to coupon_path, notice: "會員註冊成功"
    else
      flash[:notice] = "請完成資料填寫"
      render :sign_up
    end
  end

  def sign_out
    sign_out_user
    redirect_to root_path, notice: "您已登出，掰掰掰掰"
  end


  def sign_in
    @user = User.new
    coupon_path
  end

  def login
    user = User.new.login(user_params)
    
    if user
      sign_in_user(user)
      redirect_to coupon_path, notice: "歡迎光臨"
    else
      redirect_to sign_in_users_path, notice: "帳號或密碼輸入錯誤"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :id_number, :phone_number, :password)
  end

  def sign_in_user(user)
    session[:user_token] = user.id
  end

  def sign_out_user
    session[:user_token] = nil
  end
end
