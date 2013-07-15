class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def index
    @users = User.all
  end

  def create
  	@user = User.new(params[:user])

  	if @user.save
      if params[:stripeToken] != nil
          customer = Stripe::Customer.create(
            :email => @user.email,
            :card  => params[:stripeToken],
            :plan => "paid"
          )
      end
      UserMailer.signup_confirmation(@user).deliver
  		redirect_to root_url, :notice => 'Thanks for signing up! Check your email to activate your account'
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
