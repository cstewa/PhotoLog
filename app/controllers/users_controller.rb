class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
      auto_login(@user)
      UserMailer.signup_confirmation(@user).deliver
  		redirect_to user_url(@user.id)
  	else
  		render :new
  	end
  end

  def show
  	@user = User.find(params[:id])
  end

  def activate
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to(login_path, :notice => 'Account successfully activated:)')
    else
      not_authenticated
    end
  end

end
