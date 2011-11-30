module MeetingsHelper
	def no_meetings(meetings)
		content_tag('li', "No Meetings") if meetings.empty?
	end
end
