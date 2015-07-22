class Job < ActiveRecord::Base

	validates :Customer_name, :presence => true
	validates :Zipcode, :presence => true
	validates :Street_Address, :presence => true
	validates :state, :presence => true
	validates :Job_Day, :presence => true
end
