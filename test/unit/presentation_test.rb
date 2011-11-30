require 'test_helper'

class PresentationTest < ActiveSupport::TestCase
 
  def test_should_belongs_to_meeting
    rjs = presentations(:rjs_templates)
    assert_kind_of Meeting, rjs.meeting
  end
 
 
 
end
