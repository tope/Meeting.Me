class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  
  helper_method 	:logged_in?, :admin?
  
  before_filter :initialize_user
  
  helper_method		:logged_in?
  
  protected
  
  def logged_in?
    @current_user.is_a?(User)
  end
  
  def initialize_user
    @current_user = User.find_by_id(session[:user]) if session[:user]
  end
  
  def admin?
    logged_in? && @current_user.admin?
  end
  
  def admin_required
    redirect_to_login unless admin?
  end
  
  def login_required
    redirect_to_login unless logged_in?
  end
  
  def redirect_to_login
    redirect_to(:controller => 'sessions', :action => 'new')
  end
  
end
