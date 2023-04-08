class SessionsController < ApplicationController
    before_action :redirect_if_authenticated, only: [:create, :new]

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user
      if @user.authenticate(params[:user][:password])
        login @user
        redirect_to root_path, notice: "Sikeres bejelentkezés!"
      else
        flash.now[:alert] = "Helytelen felhasználónév vagy jelszó!"
        render :new, status: :unprocessable_entity, notice: "Helytelen felhasználónév vagy jelszó!"
      end
    else
      flash.now[:alert] = "Helytelen felhasználónév vagy jelszó!"
      render :new, status: :unprocessable_entity, notice: "Helytelen felhasználónév vagy jelszó!"
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: "Sikeres kijelentkezés!"
  end

  def new
  end
end
