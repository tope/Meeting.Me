require File.dirname(__FILE__) + '/../test_helper'

class MeetingTest < ActiveSupport::TestCase

  fixtures	:meetings, :presentations
  
  def test_should_find_upcoming_meetings
  
    meetings = Meeting.upcoming_meetings
    assert meetings.size > 0
    
    for meeting in meetings
      assert meeting.meets_on > Time.now.to_date
    end
  
  end
  
  def test_should_find_past_meetings
    meetings = Meeting.past_meetings
    assert meetings.size > 0
    
    for meeting in meetings
      assert meeting.meets_on <= Time.now.to_date
    end
  end
  
  def test_should_format_date_as_name
    meeting = meetings(:todays_meeting)
    assert_match /\w* \d{1,2}, \d{4}/i, meeting.name
  end
  
  def test_should_create_meeting
    assert_difference 'Meeting.count', 1 do
      meeting = create_meeting
      assert !meeting.new_record?
    end
  end
  
  def test_should_require_meets_on
    m = create_meeting(:meets_on => nil)
    assert m.errors.invalid?(:meets_on)
  end
  
  def test_should_have_a_location_with_four_char_minimum
    m = create_meeting(:location => 'boo')
    assert m.errors.invalid?(:location)
  end
  
  protected
  
  def create_meeting(options = {})
    attrs = { :meets_on => "2011-12-01", :location => "Zepler Building", :description => "Lightning Talks" }.merge(options)
    Meeting.create(attrs)
  end
  
  def test_should_have_many_presentations
    meeting = meetings(:todays_meeting)
    assert meeting.presentations.size > 0
    assert_kind_of Presentation, meeting.presentations.first
  end
  
  def test_should_build_comma_separated_presentations
    m = meetings(:todays_meeting)
    assert_equal 'Creating Rake Tasks, RJS Templates', m.presentation_list
    
    m = meetings(:next_months_meeting)
    assert_equal 'no presentations', m.presentation_list
  end
  
  
end
