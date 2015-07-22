json.array!(@jobs) do |job|
  json.extract! job, :id, :Customer_name, :Zipcode, :Street_Address, :state, :Job_Day, :day_id, :time_of_day
  json.url job_url(job, format: :json)
end
