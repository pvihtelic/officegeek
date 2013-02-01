class HomeController < ApplicationController
  
	def index
    @home_banner = true
    @user = User.new
    @packages = Package.all
    @tutorials = Tutorial.all
    @intro_tutorials = Tutorial.where(:package_id=>1)
    @intermediate_tutorials = Tutorial.where(:package_id=>2)
  	end



end
