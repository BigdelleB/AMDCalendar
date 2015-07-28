class AddTypeIdToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :type_id, :string
  end
end
