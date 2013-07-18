class UserMailer < ActionMailer::Base
	default :from => "christina.v.stewart@gmail.com"

  def signup_confirmation(user)
    @user = user
  	@url = activate_user_url(user.activation_token)
  	mail(:to => user.email, :subject => "Thanks for Signing Up!")
  end

  def activation_success(user)
  	@user = user
  	@url = login_url
  	mail(:to => user.email, :subject => "Sweet! You have an activated account now.")
  end

  def reset_password_email(user)
    @user = user
    @url  = edit_password_reset_url(user.reset_password_token)
    mail(:to => user.email, :subject => "Your password has been reset")
  end


end
