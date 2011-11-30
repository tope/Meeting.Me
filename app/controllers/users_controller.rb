class UsersController < ApplicationController

  before_filter 	:find_user, :except => [:index, :new, :create]
  before_filter		:confirm_user_owns_record, 	:only => [:edit, :update]

  def index
    @users = User.find(:all, :order => "name")
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end
  
  def create 
    @user = User.new(params[:user])
    
    if @user.save
      @current_user = @user
      session[:user] = @user.id
      
      flash[:notice] = "Successfully signed up"
      redirect_to :action => "show", :id => @user.id
    else 
      render :action => "new"
    end
  end
  
  def update
    @user.admin = params[:user][:admin] if admin?
    if @user.update_attributes(params[:user])
      flash[:notice] = 'User successfully updated.'
      redirect_to :action => "show", :id => @user.id
    else
      render 	:action => "edit"
    end
  end
  
  def destroy
  
    @user.destroy
    flash[:notice] = 'User successfully destroyed'
    redirect_to		:action		=>		"index"
  
  end
  
  
  private 
  
  def find_user
    @user = User.find(params[:id])
  end
  
  def confirm_user_owns_record
    return if admin?
    if @user.id != @current_user.id
      redirect_to :action => "edit", :id => @current_user.id
    end
  end
  

end























