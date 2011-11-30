class Presentation < ActiveRecord::Base

  belongs_to 		:meeting
  belongs_to		:user
  
  validates_presence_of		:title, :user


end
