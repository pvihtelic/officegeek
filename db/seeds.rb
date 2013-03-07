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
	{:price => 9.99, :title => 'Introduction to Excel', :description => 'This comprehensive screencast tutorial, with numerous template and example Microsoft Excel files included as downloads, gives a Beginner an overview of the most popular business software program in the world. Become productive with Excel after finishing our Introduction to Excel lessons, which are approximately 10-25 minutes each episode.  We have designed our Beginner Excel course to be as frictionless as possible, with detailed walk throughs and examples discussed.  Watch the episodes first, then give it a try yourself.  Take advantage of having reference material available 24 hours a day.', :length => 180},
	{:price => 9.99, :title => 'Intermediate Tutorials', :description => 'Take your Excel skills to the next level with these useful lessons.  The tutorial is approximately two hours long, giving you a detailed and easy to follow explanation of complex material.', :length => 120}
]

tutorials = [
	{:package_id => 1, :price => 0, :title => "Starting From Scratch", :description => "First steps to getting started with Microsoft Excel.", :length => 18, :video_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_starting_from_scratch.m4v", :excel_path => 'http://s3.amazonaws.com/officescholar/intro_to_excel_1_starting_from_scratch.xlsx'},
	{:package_id => 1, :price => 0, :title => "Worksheets", :description => "See how to manipulate data, modify the structure of a worksheet and perform basic tasks to learn the ins and outs of an Excel worksheet, the foundation of the tool.", :length => 16, :video_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_worksheets.m4v", :excel_path => 'http://s3.amazonaws.com/officescholar/intro_to_excel_2_worksheets.xlsx'},
	{:package_id => 1, :price => 0, :title => "Intro to Formulas", :description => "First glimpse into using Excel as a powerful calculator and analysis tool. We begin with manually operations and end with built-in functions.", :length => 11, :video_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_intro_to_formulas.m4v", :excel_path => 'http://s3.amazonaws.com/officescholar/intro_to_excel_3_intro_to_formulas.xlsx'},
	{:package_id => 1, :price => 0, :title => "Intro to Formatting", :description => "See how to customize the look and feel of your Excel worksheets.", :length => 14, :video_path => "/http://s3.amazonaws.com/officescholar/intro_to_excel_intro_to_formatting.m4v", :excel_path => 'http://s3.amazonaws.com/officescholar/intro_to_excel_4_intro_to_formatting.xlsx'},
	{:package_id => 1, :price => 0, :title => "Charts", :description => "First look into charts gives basic overview of various chart types available in Excel as well specific instructional walk-throughs building column, pie, line and sparkline charts from scratch.", :length => 23, :video_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_charts.m4v", :excel_path => 'http://s3.amazonaws.com/officescholar/intro_to_excel_5_charts.xlsx'},
	{:package_id => 1, :price => 0, :title => "Sorting and Filtering", :description => "Both sorting and filtering are demonstrated on example data tables, along with multiple conditions and the VLOOKUP function for referencing data in other locations based on a matched value.", :length => 11, :video_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_sorting_and_filtering.m4v", :excel_path => 'http://s3.amazonaws.com/officescholar/intro_to_excel_6_sorting_and_filtering.xlsx'},
	{:package_id => 1, :price => 0, :title => "Pivot Tables", :description => "Using data set from the 2012-2013 NFL Football season, see how to create, modify, format and sort a pivot table.  Also cover Pivot Table filters using Excel 2010's new Slicer feature for a more visual filter interface.", :length => 13, :video_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_pivot_tables.m4v", :excel_path => 'http://s3.amazonaws.com/officescholar/intro_to_excel_7_pivot_tables.xlsx'},
	{:package_id => 1, :price => 0, :title => "Printing", :description => "Walk through printing a document in Excel including overviews on print preview, headers and footers, print areas and repeating a single row as a column heading for multiple pages.", :length => 10, :video_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_printing.m4v", :excel_path => 'http://s3.amazonaws.com/officescholar/intro_to_excel_8_printing.xlsx'}
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
	{:tutorial_id => 4, :title => "Formatting Tips", :description => "Several tricks everyone should be using in Excel to save time with formatting.", :length => 2},

	{:tutorial_id => 5, :title => "Chart Types", :description => "Overview of chart types offered in Excel.", :length => 2},
	{:tutorial_id => 5, :title => "Column Chart", :description => "Step-by-step tutorial on building a column chart with example data.", :length => 2},
	{:tutorial_id => 5, :title => "Pie Chart", :description => "Watch as Pat creats a pie chart with sample data from scratch.", :length => 2},
	{:tutorial_id => 5, :title => "Line Chart", :description => "Tutorial on creating a line chart in Excel.", :length => 2},
	{:tutorial_id => 5, :title => "Sparklines", :description => "See how to creat column chart sparklines and line chart sparklines easily.", :length => 2},

	{:tutorial_id => 6, :title => "Sorting", :description => "Various data sorts are performed on a sample table.", :length => 2},
	{:tutorial_id => 6, :title => "Filtering", :description => "Example data table is filtered using Excel's auto filters.", :length => 2},
	{:tutorial_id => 6, :title => "VLOOKUP", :description => "Use the VLOOKUP function to reference data in other tables based on a matched value.", :length => 2},

	{:tutorial_id => 7, :title => "Uses", :description => "When to use a pivot table and why they can be helpful.", :length => 2},
	{:tutorial_id => 7, :title => "Creating a Pivot Table", :description => "How to select data and create a pivot table.", :length => 2},
	{:tutorial_id => 7, :title => "Rearranging a Pivot Table", :description => "Overview on how to quickly modify the layout of a pivot table.", :length => 2},
	{:tutorial_id => 7, :title => "Formatting a Pivot Table", :description => "Demonstration showing how to format a pivot table.", :length => 2},
	{:tutorial_id => 7, :title => "Sorting and Filtering", :description => "Covers sorting inside a pivot table as well as filtering with the Slicer.", :length => 2},

	{:tutorial_id => 8, :title => "Print Preview", :description => "Learn the shortcut for quickly previewing an excel document.", :length => 2},
	{:tutorial_id => 8, :title => "Page Layout and Setup", :description => "Walk through sections of the page setup.", :length => 2},
	{:tutorial_id => 8, :title => "Headers and Footers", :description => "See how to modify the header and footer.", :length => 2},
	{:tutorial_id => 8, :title => "Page Breaks", :description => "Watch a demonstration on inserting and removing page breaks.", :length => 2},
	{:tutorial_id => 8, :title => "Printing Selected Areas", :description => "How to print selected cell ranges and areas of a spreadsheet.", :length => 2},
	{:tutorial_id => 8, :title => "Repeat Rows as Column Headers", :description => "Use a single row as the column header on multiple pages by repeating it.", :length => 2}
]

Package.create packages
Tutorial.create tutorials
Topic.create topics