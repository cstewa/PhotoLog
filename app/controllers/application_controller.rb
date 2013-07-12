class ApplicationController < ActionController::Base
  protect_from_forgery

	def not_authenticated
	  redirect_to login_url, :notice => "Please login first to access this page."
	end

	def current_users_list
    current_users.map {|u| u.email}.join(", ")
  end

	helper_method :current_users_list


end
