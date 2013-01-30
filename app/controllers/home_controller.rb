class HomeController < ApplicationController
  
	def index
    @user = User.new
    @packages = Package.all
    @tutorials = Tutorial.all
    @intro_tutorials = Tutorial.where(:package_id=>1)
    
  	end



end
