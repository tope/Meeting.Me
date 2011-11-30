class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
	  t.string		:email
	  t.string		:password, 	:limit => 40
	  t.string		:name
	  t.text		:profile,	:text
	  t.boolean		:admin,		:default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
