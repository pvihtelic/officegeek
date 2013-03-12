class HomeController < ApplicationController
  
	def index
    @home_banner = true
    if current_user.nil?
        @user = User.new
      else 
        @user = User.find(current_user.id)
    end
    @packages = Package.all
    @tutorials = Tutorial.all
    @intro_tutorials = Tutorial.where(:package_id=>1)
    @intermediate_tutorials = Tutorial.where(:package_id=>2)
  	end

  	def faq
  	end

  	def privacy_policy
  	end

  	def terms_and_conditions
  	end

    def chicago_classes
      @tutorials = Tutorial.all
    end

end
