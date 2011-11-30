class HomepageController < ApplicationController
  def index
    @meeting = Meeting.upcoming_meetings.first
  end

end
