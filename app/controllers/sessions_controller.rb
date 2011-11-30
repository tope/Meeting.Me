class SessionsController < ApplicationController
  def new
  end
  
  def create 
    @current_user = User.authenticate(params[:email], params[:password])
    if @current_user
      session[:user] = @current_user.id
      redirect_to :controller => "users", :action => "show", :id => @current_user.id
    else 
      flash[:notice] = "No user was found with this email or password"
      render :action => 'new'
    end
  end
  
  def destroy
    reset_session
    
    flash[:notice] = "Logged out successfully"
    redirect_to 	:action 	=>		"new"
    
  end

end
