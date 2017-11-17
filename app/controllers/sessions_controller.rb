class SessionsController < ApplicationController
  def new
    if logged_in?
      @hoge = current_user.build_hoge
    end
  end

  def create
    loginid = params[:session][:loginid]
    password = params[:session][:password]
    if login(loginid, password)
      flash[:success] = 'ログインに成功しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end

  private

  def login(loginid, password)
    @user = User.find_by(loginid: loginid)
    if @user && @user.authenticate(password)
      # ログイン成功
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
end
