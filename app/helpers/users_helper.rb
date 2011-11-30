module UsersHelper
  def image_for_admin_status(user)
    if user.admin?
      image_tag("star.gif", :alt => "Admin", :size => "16x16")
    end
  end
  
  def user_owns_record?
    logged_in? && @user.id == @current_user.id
  end
  
  
end
