module ApplicationHelper

  def flash_notice
    if flash[:notice]
    	content_tag('div', h(flash[:notice]), {:id => "flash_notice"})
    end
  end

end
