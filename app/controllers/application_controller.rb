class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  after_action :verify_authorized, :except => :index
  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def user_not_authorized
    if current_user
      flash[:alert] = "Sinulla ei ole oikeutta tehdä tätä."
      redirect_to(request.referrer || root_path)
    else
      flash[:alert] = "Kirjaudu ensin sisään."
      redirect_to(request.referrer || root_path) # TODO: Redirect to login path
    end
  end
end
