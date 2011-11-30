class PresentationsController < ApplicationController

  before_filter		:find_meeting
  before_filter		:find_presentation, :except => [:new, :create]
  before_filter		:admin_required

  def new
    @presentation = Presentation.new
  end

  def edit
  end
  
  def create
    @presentation = Presentation.new(params[:presentation])
    if @meeting.presentations << @presentation
      redirect_to_meeting('Presentation successfully created.')
    else
      render 	:action => "new"
    end
  end
  
  
  def update
    if @presentation.update_attributes(params[:presentation])
      redirect_to_meeting('Presentation successfully updated.')
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @presentation.destroy 
    redirect_to_meeting ('Presentation successfully destroyed.')
  end
  
  
  private
  
  def find_meeting
    @meeting = Meeting.find(params[:meeting_id])
  end
  
  def find_presentation
    @presentation = @meeting.presentations.find(params[:id])
  end
  
  def redirect_to_meeting(notice)
    flash[:notice] = notice
    redirect_to  	:controller => "meetings", :action => "show", :id => @meeting.id
  end
  

end
