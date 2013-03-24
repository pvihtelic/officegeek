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
    @topics_preview = Topic.where(:title => ["Navigation","Keyboard Shortcuts","IF Statements","Sorting","VLOOKUP","Creating a Pivot Table"])
    @topics = Topic.all
    # @intro_tutorials = Tutorial.where(:package_id=>1)
    # @intermediate_tutorials = Tutorial.where(:package_id=>2)
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

    prepend_before_filter :require_no_authentication, :only => [ :new, :create ]
    prepend_before_filter :allow_params_authentication!, :only => :create
    prepend_before_filter { request.env["devise.skip_timeout"] = true }

    # GET /resource/sign_in
    def new
      self.resource = build_resource(nil, :unsafe => true)
      clean_up_passwords(resource)
      respond_with(resource, serialize_options(resource))
    end

    # POST /resource/sign_in
    def create
      self.resource = warden.authenticate!(auth_options)
      set_flash_message(:notice, :signed_in) if is_navigational_format?
      sign_in(resource_name, resource)
      respond_with resource, :location => after_sign_in_path_for(resource)
    end

    protected

    def serialize_options(resource)
      methods = resource_class.authentication_keys.dup
      methods = methods.keys if methods.is_a?(Hash)
      methods << :password if resource.respond_to?(:password)
      { :methods => methods, :only => [:password] }
    end

    def auth_options
      { :scope => resource_name, :recall => "#{controller_path}#new" }
    end

end
