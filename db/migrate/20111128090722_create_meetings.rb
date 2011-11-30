class CreateMeetings < ActiveRecord::Migration
  def self.up
    create_table :meetings do |t|
	  t.date 		:meets_on
	  t.string		:location
	  t.text		:description	
      t.timestamps
    end
  end

  def self.down
    drop_table :meetings
  end
end
