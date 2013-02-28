# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => ENV['ADMIN_NAME'], :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup, :confirmed_at => Time.now.utc
user.confirm!
puts 'New user created: ' << user.name
user2 = User.create! :name => "test", :email => "pvskisteak@yahoo.com", :password => "123456", :password_confirmation => "123456", :confirmed_at => Time.now.utc
user2.confirm!
puts 'New user created: ' << user2.name
user.add_role :admin

# create content for tutorials with below

Package.destroy_all
Tutorial.destroy_all
Topic.destroy_all

packages = [ 
	{:price => 9.99, :title => 'Introduction to Excel', :description => 'This comprehensive screencast tutorial, with numerous template and example Microsoft Excel files, gives a Beginner an overview of the most popular business software program in the world. Become productive with Excel after finishing our Introduction to Excel lessons, which are approximately 10-20 minutes each.', :length => 180},
	{:price => 9.99, :title => 'Intermediate Tutorials', :description => 'Take your Excel skills to the next level with these useful lessons.  The tutorial is approximately two hours long, giving you a detailed and easy to follow explanation of complex material.', :length => 120}
]

tutorials = [
	{:package_id => 1, :price => 0, :title => "Starting From Scratch", :description => "First steps to getting started with Microsoft Excel.", :length => 18, :video_path => "/videos/intro_to_excel_starting_from_scratch.m4v", :excel_path => '/excel_files/intro_to_excel_1_starting_from_scratch.xlsx'},
	{:package_id => 1, :price => 0, :title => "Worksheets", :description => "See how to manipulate data, modify the structure of a worksheet and perform basic tasks to learn the ins and outs of an Excel worksheet, the foundation of the tool.", :length => 16, :video_path => "/videos/intro_to_excel_worksheets.m4v", :excel_path => '/excel_files/intro_to_excel_2_worksheets.xlsx'},
	{:package_id => 1, :price => 0, :title => "Intro to Formulas", :description => "First glimpse into using Excel as a powerful calculator and analysis tool. We begin with manually operations and end with built-in functions.", :length => 11, :video_path => "/videos/intro_to_excel_intro_to_formulas.m4v", :excel_path => '/excel_files/intro_to_excel_3_intro_to_formulas.xlsx'},
	{:package_id => 1, :price => 0, :title => "Intro to Formatting", :description => "See how to customize the look and feel of your Excel worksheets.", :length => 14, :video_path => "/videos/intro_to_excel_intro_to_formatting.m4v", :excel_path => '/excel_files/intro_to_excel_4_intro_to_formatting.xlsx'}
]

topics = [
	{:tutorial_id => 1, :title => "What is Excel?", :description => "Overview of Microsoft Excel and how it can be used.", :length => 2},
	{:tutorial_id => 1, :title => "Accessing Excel", :description => "Learn how to open Excel multiple ways including creating a desktop shortcut.", :length => 2},
	{:tutorial_id => 1, :title => "Navigation", :description => "Explanation of Excel windows and introduction to navigating the ribbon interface.", :length => 2},
	{:tutorial_id => 1, :title => "Opening, Saving and Closing", :description => "Walk through discussing how to open a file in Excel from the program, how to save a file and how to close out of the program.", :length => 2},
	{:tutorial_id => 1, :title => "Basic Keyboard Shortcuts", :description => "Useful keyboard shortcuts that will save you a ton of time and effort over the long haul.", :length => 2},
	{:tutorial_id => 1, :title => "File Formats", :description => "Learn the importance of file formats in Microsoft Office products with a focus on Excel.", :length => 2},
	{:tutorial_id => 1, :title => "Help Feature", :description => "When you cannot solve a problem on your own or find yourself stuck, turn to the help feature.", :length => 2},
	
	{:tutorial_id => 2, :title => "Creating a Worksheet", :description => "Tutorial covers creating a new worksheet in Excel and related topics.", :length => 2},
	{:tutorial_id => 2, :title => "Entering Data", :description => "Learn various techniques for entering data in Excel.", :length => 2},
	{:tutorial_id => 2, :title => "Selecting Data", :description => "Instruction on how to select cells and ranges of cells in Excel.", :length => 2},
	{:tutorial_id => 2, :title => "Copying and Pasting", :description => "More in depth overview of Excel's rows and columns structure.", :length => 2},
	{:tutorial_id => 2, :title => "Manipulating Data", :description => "Screencast covers techniques for modifying data in Excel.", :length => 2},
	{:tutorial_id => 2, :title => "Rows and Columns", :description => "More in depth overview of Excel's rows and columns structure.", :length => 2},
	{:tutorial_id => 2, :title => "Grouping and Hiding", :description => "Learn how to group and hide rows and columns in Excel.", :length => 2},

	{:tutorial_id => 3, :title => "Overview and Uses", :description => "Introduction to formulas and functions in Excel with examples of common uses.", :length => 2},
	{:tutorial_id => 3, :title => "Manual Calculations", :description => "Learn the fundamentals of executing an Excel formula by first learning manual calculations.", :length => 2},
	{:tutorial_id => 3, :title => "Functions", :description => "First look at Excel's built in functions including explanation on setting up functions in Excel.", :length => 2},
	{:tutorial_id => 3, :title => "IF Statements", :description => "Preview to IF statements in Excel, which is a powerful function used often.", :length => 2},

	{:tutorial_id => 4, :title => "Formatting Cells", :description => "The first part of learning how to format in Excel is mastering cell formats.", :length => 2},
	{:tutorial_id => 4, :title => "Formatting Numbers", :description => "Introduction to number formats and font formatting options.", :length => 2},
	{:tutorial_id => 4, :title => "Alignment", :description => "Learn various techniques for aligning elements in Excel.", :length => 2},
	{:tutorial_id => 4, :title => "Formatting Tips", :description => "Several tricks everyone should be using in Excel to save time with formatting.", :length => 2}
]

Package.create packages
Tutorial.create tutorials
Topic.create topics