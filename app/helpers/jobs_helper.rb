module JobsHelper
	require 'net/http'
	require 'open-uri'
	require "openssl"
	module OpenSSL
	
	module SSL
		remove_const :VERIFY_PEER
	end

		OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
	end
	
	@@API_KEY="AIzaSyDWP95Wa154Z72rg_pSkopK-7TAhx139CU";

	@@STATE;

	@@NAME

	@@STREET_ADDRESS;

	@@ZIPCODE;

	@@JSON;

	@@DAY_ID







	#initializer
	def initialize_fields(job)
		@@STATE=job.state;
		@@NAME=job.Customer_name;
		@@STREET_ADDRESS=job.Street_Address;
		@@ZIPCODE=job.Zipcode;
		
	end



	def verifyFields()
		# if defined?(@@STATE).nil?||defined?(@@NAME).nil?||defined?(@@STREET_ADDRESS).nil? || defined(@@ZIPCODE).nil?
		# 	return false;
		

		# if @@STATE=nil || @@NAME=nil || @@STREET_ADDRESS=nil || @@ZIPCODE=nil
		# 	return false

		if @@STATE=="" || @@NAME=="" || @@STREET_ADDRESS=="" || @@ZIPCODE==""
			return false
		else 
			return true
		end
	end
		
	
	#gets the large geolocation JSON from google
	def extractJSON()
		# if verifyFields()==false
		# 	return ;
		# end
		url="https://maps.googleapis.com/maps/api/geocode/json?address="+@@STREET_ADDRESS+" "+@@STATE+" "+@@ZIPCODE+"&key="+@@API_KEY
		encoded_url = URI.encode(url)
		uri=URI.parse(encoded_url)
		#uri=uri.open
		str=uri.read
		@@JSON=str;
	end

	#gets the coordinates of the address
	def getCoordinates()
		# if !verifyFields()==false
		# 	return;
		# end
		latitude=JSON.parse(@@JSON)["results"][0]["geometry"]["location"]["lat"]
		longitude=JSON.parse(@@JSON)["results"][0]["geometry"]["location"]["lng"]
		arr=[];
		arr.insert(0,latitude)
		arr.insert(1,longitude)
		return arr
	end


	def setDay_id_default(job)
		if job.Job_Day.casecmp("monday")==0
			job.update_attributes(:day_id => 0);
		elsif job.Job_Day.casecmp("tuesday")==0
			job.update_attributes(:day_id => 1);
		elsif job.Job_Day.casecmp("wednesday")==0
			job.update_attributes(:day_id => 2);
		elsif job.Job_Day.casecmp("thursday")==0
			job.update_attributes(:day_id => 3);
		elsif job.Job_Day.casecmp("friday")==0
			job.update_attributes(:day_id => 4);
		end
			
	end

	def setDay_id(job,value)
		job.day_id=value
	end

	









end
