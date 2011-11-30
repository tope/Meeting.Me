class MeetingsController < ApplicationController

  before_filter	:find_meeting,	:except => [:index, :new, :create]
  
  before_filter	:admin_required, :except => [:index, :show]

  def index
  	@upcoming_meetings	=	Meeting.upcoming_meetings
  	@past_meetings		=	Meeting.past_meetings
  end

  def new
  	@meeting = Meeting.new
  end
  
  def create
  	@meeting	=	Meeting.new(params[:meeting])
  	if @meeting.save
  		flash[:notice]	=	'Meeting successfully created.'
  		redirect_to :action => "index"
  	else 
  		render :action 	=> "new"
  	end
  end
  
  def show
	#@meeting 	=	Meeting.find(params[:id])
  end
  
  def edit
  	#@meeting 	=	Meeting.find(params[:id])
  end
  
  def update
  	
  	if @meeting.update_attributes(params[:meeting])
    	flash[:notice] = 'Meeting successfully updated.'
    	redirect_to 	:action => 	"show" , :id	=>	params[:id]
  	else
    	render	:action => "edit"
  	end
  end
  
  def destroy
   
    @meeting.destroy
    
    flash[:notice] = 'Meeting successfully destroyed.'
    redirect_to :action => "index"
    
  end
  
  private
  
  def find_meeting
    @meeting	=	Meeting.find(params[:id])
  end

end
