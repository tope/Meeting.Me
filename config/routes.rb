UserGroup::Application.routes.draw do  |map|

  map.root		:controller		=>		"homepage"

  map.meeting	'/meetings/show/:id',	:controller => "meetings", :action => "show"
  
  map.new_meeting 	'/meetings/new', :controller => "meetings", :action => "new"
  
  
  map.presentation 'meetings/:meeting_id/presentations/:action/:id', :controller => "presentations", :action => "show", :action => "show", :meeting_id => /\d+/
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id/:format'
  
  map.connect "users/index/:id/:page", :controller => "users", :action => "index", :page => "1"
  
  map.connect "users/index/:id/:page", :controller => "users", :action => "index", :defaults => {:page => "1"}
  
  map.connect "users/index/:id/:page", :controller => "users", :action => "index", :page => /\d+/
  
  map.connect "users/index/:id/:page", :controller => "users", :action => "index", :requirements => {:page => /\d+/}
  
  
  
  
end
