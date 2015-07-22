class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :Customer_name
      t.string :Zipcode
      t.string :Street_Address
      t.string :state
      t.string :Job_Day
      t.integer :day_id
      t.string :time_of_day

      t.timestamps null: false
    end
  end
end
