class AddJobTypeidToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :job_id, :string
  end

  def self.up 
  	add_column :jobs, :typeid, :string
  end

  def self.down
  	remove_column :jobs, :typeid
  end
end
