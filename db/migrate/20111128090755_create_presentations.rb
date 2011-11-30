class CreatePresentations < ActiveRecord::Migration
  def self.up
    create_table :presentations do |t|
	  t.integer		:meeting_id
	  t.integer		:user_id
	  t.string		:title
	  t.text		:description
      t.timestamps
    end
  end

  add_index		:presentations, 	:meeting_id
  add_index		:presentations,		:user_id

  def self.down
    drop_table :presentations
  end
end
