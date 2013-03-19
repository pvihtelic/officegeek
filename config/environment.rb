# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Officegeek::Application.initialize!

# # disqus comments
# Rails::Initializer.run do |config|
#   config.after_initialize do
#     Disqus::defaults[:account] = 'OfficeScholar'
#     # so that the comments will load up in development environment
#     Disqus::defaults[:developer] = true 
#     Disqus::defaults[:container_id] = 'disqus_thread'
#     Disqus::defaults[:show_powered_by] = false
#   end
# end
