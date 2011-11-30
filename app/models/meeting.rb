class Meeting < ActiveRecord::Base

  validates_presence_of		:meets_on
  validates_length_of		:location,	:minimum => 4
  
  has_many					:presentations

  def self.upcoming_meetings
  	find(:all, :conditions => "meets_on > CURRENT_TIMESTAMP", :order	=> "meets_on", :include => :presentations)
  	
  	
  end
  
  def self.past_meetings
  	find(:all, :conditions => "meets_on <= CURRENT_TIMESTAMP", :order => "meets_on", :include => :presentations)
  end

  def name 
  	meets_on.to_s(:long)
  end
  
  def presentation_list
    if presentations.size > 0
      presentations.collect {|p| p.title}.join(', ')
    else 
      'no presentations'
    end
  end

end
