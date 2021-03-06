ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :user_name            => ENV['MY_EMAIL'],
  :password             => ENV['MY_PASSWORD'],
  :authentication       => "plain",
  :enable_starttls_auto => true
}

if Rails.env.production?
	ActionMailer::Base.default_url_options[:host] = "photo-log.herokuapp.com"
else
	ActionMailer::Base.default_url_options[:host] = "localhost:5000"
end
Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?