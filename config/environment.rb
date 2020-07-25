# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# get rid of the field_with_errors setting that rails is adding to an input field 
# which is hit a validation error (every time you update environment rb or any kind of your
# configuration file it's a good idea to restart your server)
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
	html_tag.html_safe
end