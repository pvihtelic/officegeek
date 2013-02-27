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
	{:price => 9.99, :title => 'Introduction to Excel', :description => 'This comprehensive, three hour screencast tutorial with numerous template and example Microsoft Excel files gives a Beginner an overview of the most popular business software program in the world. Become productive with Excel after finishing our eight Introduction to Excel lessons, which are approximately 30 minutes each.', :length => 180},
	{:price => 9.99, :title => 'Intermediate Tutorials', :description => 'Take your Excel skills to the next level with these useful lessons.  The tutorial is approximately two hours long, giving you a detailed and easy to follow explanation of complex material.', :length => 120}
]

tutorials = [
	{:package_id => 1, :price => 0, :title => "Starting From Scratch", :description => "First steps to getting started with Microsoft Excel.", :length => 18, :video_path => "/videos/intro_to_excel_starting_from_scratch.m4v"},
	{:package_id => 1, :price => 0, :title => "Worksheets", :description => "See how to manipulate data, modify the structure of a worksheet and perform basic tasks to learn the ins and outs of an Excel worksheet, the foundation of the tool.", :length => 16, :video_path => "/videos/intro_to_excel_worksheets.m4v"},
	{:package_id => 1, :price => 0, :title => "Intro to Formulas", :description => "First glimpse into using Excel as a powerful calculator and analysis tool. We begin with manually operations and end with built-in functions.", :length => 11, :video_path => "/videos/intro_to_excel_intro_to_formulas.m4v"},
	{:package_id => 1, :price => 0, :title => "Formatting I", :description => "See how to customize the look and feel of your Excel worksheets.", :length => 14, :video_path => "/videos/intro_to_excel_intro_to_formatting.m4v"},
	{:package_id => 1, :price => 2.99, :title => "Intro to Charts", :description => "Overview of chart types such as bar charts, pie charts and line graphs.", :length => 30, :video_path => "/videos/intro_to_excel_intro_to_formatting.m4v"},
	{:package_id => 1, :price => 2.99, :title => "Data Analyis I", :description => "Learn best practices for data analyses using tools provided by Excel.", :length => 30, :video_path => "/videos/intro_to_excel_intro_to_formatting.m4v"},
	{:package_id => 1, :price => 2.99, :title => "Formulas II", :description => "Next step to understanding and applying Excel's wide range of formulas.", :length => 30, :video_path => "/videos/intro_to_excel_intro_to_formatting.m4v"},
	{:package_id => 1, :price => 2.99, :title => "Printing", :description => "Everying you need to print an Excel document the way you want it.", :length => 30, :video_path => "/videos/intro_to_excel_intro_to_formatting.m4v"},
	{:package_id => 2, :price => 2.99, :title => "Pivot Tables", :description => "Overview and examples provided in this tutorial on Pivot Tables, one of the most widely used data analysis tools in Excel.", :length => 30, :video_path => "/videos/intro_to_excel_intro_to_formatting.m4v"},
	{:package_id => 2, :price => 2.99, :title => "Formatting II", :description => "Take your Excel document look and feel to the next level with more advanced formatting.", :length => 30, :video_path => "/videos/intro_to_excel_intro_to_formatting.m4v"},
	{:package_id => 2, :price => 2.99, :title => "Data Analysis II", :description => "Extend your data analysis skills with intermediate version of our popular data analysis series.", :length => 30, :video_path => "/videos/intro_to_excel_intro_to_formatting.m4v"},
	{:package_id => 2, :price => 2.99, :title => "Formulas III", :description => "Dive into nested IF statements and other complex functions.", :length => 30, :video_path => "/videos/intro_to_excel_intro_to_formatting.m4v"},
	{:package_id => 2, :price => 2.99, :title => "Build a Budget", :description => "Pat takes you from start to finish on an example budget, which covers a broad range of Excel skills to master.", :length => 30, :video_path => "/videos/intro_to_excel_intro_to_formatting.m4v"},
	{:package_id => 2, :price => 2.99, :title => "Financial Models", :description => "Learn from doing a project involving financial statements.", :length => 30, :video_path => "/videos/intro_to_excel_intro_to_formatting.m4v"},
	{:package_id => 2, :price => 2.99, :title => "Intro to Macros", :description => "Beginning automating your tasks with Excel's macros.", :length => 30, :video_path => "/videos/intro_to_excel_intro_to_formatting.m4v"},
	{:package_id => 2, :price => 2.99, :title => "Building a Database", :description => "Best practices and considerations when building a database.", :length => 30, :video_path => "/videos/intro_to_excel_intro_to_formatting.m4v"}
]

topics = [
	{:tutorial_id => 1, :title => "Accessing Excel", :description => "Learn how to open and save Excel files.", :length => 3},
	{:tutorial_id => 1, :title => "Navigation", :description => "Explanation of Excel windows and introduction to navigating the ribbon interface.", :length => 3},
	{:tutorial_id => 1, :title => "Ribbon Interface", :description => "Deep dive on the ribbon that Excel uses for its user interface.", :length => 3},
	{:tutorial_id => 1, :title => "Opening, Saving and Closing", :description => "We walk you through how to open a file in Excel from the program, how to save a file and how to close out of the program.", :length => 3},
	{:tutorial_id => 1, :title => "Views", :description => "Learn how to control the the way you view Excel on your computer.", :length => 3},
	{:tutorial_id => 1, :title => "Basic Keyboard Shortcuts", :description => "Useful keyboard shortcuts that will save you a ton of time and effort over the long haul.", :length => 3},
	{:tutorial_id => 1, :title => "File Formats", :description => "Learn the importance of file formats in Microsoft Office products with a focus on Excel.", :length => 3},
	
	{:tutorial_id => 2, :title => "Rows and Columns", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 2, :title => "Selecting Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 2, :title => "Manipulating Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 2, :title => "Manipulating Worksheet", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 2, :title => "Copying and Pasting", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},

	{:tutorial_id => 3, :title => "Rows and Columns", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 3, :title => "Selecting Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 3, :title => "Manipulating Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 3, :title => "Manipulating Worksheet", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 3, :title => "Copying and Pasting", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},

	{:tutorial_id => 4, :title => "Rows and Columns", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 4, :title => "Selecting Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 4, :title => "Manipulating Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 4, :title => "Manipulating Worksheet", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 4, :title => "Copying and Pasting", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},

	{:tutorial_id => 5, :title => "Rows and Columns", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 5, :title => "Selecting Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 5, :title => "Manipulating Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 5, :title => "Manipulating Worksheet", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 5, :title => "Copying and Pasting", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},

	{:tutorial_id => 6, :title => "Rows and Columns", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 6, :title => "Selecting Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 6, :title => "Manipulating Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 6, :title => "Manipulating Worksheet", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 6, :title => "Copying and Pasting", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},

	{:tutorial_id => 7, :title => "Rows and Columns", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 7, :title => "Selecting Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 7, :title => "Manipulating Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 7, :title => "Manipulating Worksheet", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 7, :title => "Copying and Pasting", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},

	{:tutorial_id => 8, :title => "Rows and Columns", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 8, :title => "Selecting Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 8, :title => "Manipulating Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 8, :title => "Manipulating Worksheet", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 8, :title => "Copying and Pasting", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},

	{:tutorial_id => 9, :title => "Rows and Columns", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 9, :title => "Selecting Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 9, :title => "Manipulating Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 9, :title => "Manipulating Worksheet", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 9, :title => "Copying and Pasting", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},

	{:tutorial_id => 10, :title => "Rows and Columns", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 10, :title => "Selecting Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 10, :title => "Manipulating Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 10, :title => "Manipulating Worksheet", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 10, :title => "Copying and Pasting", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},

	{:tutorial_id => 11, :title => "Rows and Columns", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 11, :title => "Selecting Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 11, :title => "Manipulating Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 11, :title => "Manipulating Worksheet", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 11, :title => "Copying and Pasting", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},

	{:tutorial_id => 12, :title => "Rows and Columns", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 12, :title => "Selecting Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 12, :title => "Manipulating Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 12, :title => "Manipulating Worksheet", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 12, :title => "Copying and Pasting", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},

	{:tutorial_id => 13, :title => "Rows and Columns", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 13, :title => "Selecting Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 13, :title => "Manipulating Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 13, :title => "Manipulating Worksheet", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 13, :title => "Copying and Pasting", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},

	{:tutorial_id => 14, :title => "Rows and Columns", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 14, :title => "Selecting Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 14, :title => "Manipulating Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 14, :title => "Manipulating Worksheet", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 14, :title => "Copying and Pasting", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},

	{:tutorial_id => 15, :title => "Rows and Columns", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 15, :title => "Selecting Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 15, :title => "Manipulating Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 15, :title => "Manipulating Worksheet", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 15, :title => "Copying and Pasting", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},

	{:tutorial_id => 16, :title => "Rows and Columns", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 16, :title => "Selecting Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 16, :title => "Manipulating Data", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 16, :title => "Manipulating Worksheet", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3},
	{:tutorial_id => 16, :title => "Copying and Pasting", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3}
]

Package.create packages
Tutorial.create tutorials
Topic.create topics