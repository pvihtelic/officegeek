# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html
# puts 'SETTING UP DEFAULT USER LOGIN'
# user = User.create! :name => ENV['ADMIN_NAME'], :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup, :confirmed_at => Time.now.utc
# user.confirm!
# puts 'New user created: ' << user.name
# user2 = User.create! :name => "test", :email => "pvskisteak@yahoo.com", :password => "123456", :password_confirmation => "123456", :confirmed_at => Time.now.utc
# user2.confirm!
# puts 'New user created: ' << user2.name
# user.add_role :admin

# create content for tutorials with below

Package.destroy_all
Tutorial.destroy_all
Topic.destroy_all
BlankQuiz.destroy_all

packages = [ 
	{:price => 9.99, :title => 'Introduction to Excel', :description => 'This comprehensive screencast tutorial, with numerous template and example Microsoft Excel files included as downloads, gives a Beginner an overview of the most popular business software program in the world. Become productive with Excel after finishing our Introduction to Excel lessons, which are approximately 10-25 minutes each episode.  We have designed our Beginner Excel course to be as frictionless as possible, with detailed walk throughs and examples discussed.  Watch the episodes first, then give it a try yourself.  Take advantage of having reference material available 24 hours a day.', :length => 180},
	{:price => 9.99, :title => 'Intermediate Tutorials', :description => 'Take your Excel skills to the next level with these useful lessons.  The tutorial is approximately two hours long, giving you a detailed and easy to follow explanation of complex material.', :length => 120}
]



tutorials = [
	{:package_id => 1, :price => 0, :title => "Starting From Scratch", :description => "First steps to getting started with Microsoft Excel.  This episode starts out assuming you know very little about Excel, with items such as opening Excel for the first time, but quickly moves on to more advanced topics such as keyboard shortcuts.  A great episode to get an overview of Excel and how it can be used.", :length => 18, :video_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_starting_from_scratch.m4v", :excel_path => 'http://s3.amazonaws.com/officescholar/intro_to_excel_1_starting_from_scratch.xlsx'},
	{:package_id => 1, :price => 0, :title => "Worksheets", :description => "See how to manipulate data, modify the structure of a worksheet and perform basic tasks to learn the ins and outs of an Excel worksheet, the foundation of the tool.", :length => 16, :video_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_worksheets.m4v", :excel_path => 'http://s3.amazonaws.com/officescholar/intro_to_excel_2_worksheets.xlsx'},
	{:package_id => 1, :price => 0, :title => "Intro to Formulas", :description => "First glimpse into using Excel as a powerful calculator and analysis tool. We begin with manually operations and end with built-in functions.", :length => 11, :video_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_intro_to_formulas.m4v", :excel_path => 'http://s3.amazonaws.com/officescholar/intro_to_excel_3_intro_to_formulas.xlsx'},
	{:package_id => 1, :price => 0, :title => "Intro to Formatting", :description => "See how to customize the look and feel of your Excel worksheets.", :length => 14, :video_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_intro_to_formatting.m4v", :excel_path => 'http://s3.amazonaws.com/officescholar/intro_to_excel_4_intro_to_formatting.xlsx'},
	{:package_id => 1, :price => 0, :title => "Charts", :description => "First look into charts gives basic overview of various chart types available in Excel as well specific instructional walk-throughs building column, pie, line and sparkline charts from scratch.", :length => 23, :video_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_charts.m4v", :excel_path => 'http://s3.amazonaws.com/officescholar/intro_to_excel_5_charts.xlsx'},
	{:package_id => 1, :price => 0, :title => "Sorting and Filtering", :description => "Both sorting and filtering are demonstrated on example data tables, along with multiple conditions and the VLOOKUP function for referencing data in other locations based on a matched value.", :length => 11, :video_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_sorting_and_filtering.m4v", :excel_path => 'http://s3.amazonaws.com/officescholar/intro_to_excel_6_sorting_and_filtering.xlsx'},
	{:package_id => 1, :price => 0, :title => "Pivot Tables", :description => "Using data set from the 2012-2013 NFL Football season, see how to create, modify, format and sort a pivot table.  Also cover Pivot Table filters using Excel 2010's new Slicer feature for a more visual filter interface.", :length => 13, :video_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_pivot_tables.m4v", :excel_path => 'http://s3.amazonaws.com/officescholar/intro_to_excel_7_pivot_tables.xlsx'},
	{:package_id => 1, :price => 0, :title => "Printing", :description => "Walk through printing a document in Excel including overviews on print preview, headers and footers, print areas and repeating a single row as a column heading for multiple pages.", :length => 10, :video_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_printing.m4v", :excel_path => 'http://s3.amazonaws.com/officescholar/intro_to_excel_8_printing.xlsx'}
]

Tutorial.create tutorials

@tutorial_id = Tutorial.first.id

topics = [
	{:tutorial_id => @tutorial_id, :title => "Intro", :description => "Introduction and overview of Microsoft Excel with a discussion on uses.", :length => 2, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_starting_from_scratch_intro.m4v"},
	{:tutorial_id => @tutorial_id, :title => "Accessing Excel", :description => "Learn how to open Excel multiple ways including creating a desktop shortcut.", :length => 1, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_starting_from_scratch_accessing_excel.m4v"},	
	{:tutorial_id => @tutorial_id, :title => "Navigation", :description => "Explanation of Excel windows and introduction to navigating the ribbon interface.", :length => 2, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_starting_from_scratch_navigating_excel.m4v"},
	{:tutorial_id => @tutorial_id, :title => "Open and Save", :description => "Walk through discussing how to open a file in Excel from within the program, how to save a file and how to close out of the program.", :length => 2, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_starting_from_scratch_opening_saving_closing.m4v"},
	{:tutorial_id => @tutorial_id, :title => "Keyboard Shortcuts", :description => "Useful keyboard shortcuts that will save you a ton of time and effort over the long haul.", :length => 4, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_starting_from_scratch_shortcuts.m4v"},
	{:tutorial_id => @tutorial_id, :title => "File Types", :description => "Learn the importance of file formats in Microsoft Office products with a focus on Excel.", :length => 2, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_starting_from_scratch_file_types.m4v"},
	{:tutorial_id => @tutorial_id, :title => "Help Feature", :description => "When you cannot solve a problem on your own or find yourself stuck, turn to the help feature.", :length => 2, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_starting_from_scratch_help_feature.m4v"},
	{:tutorial_id => @tutorial_id, :title => "Conclusion", :description => "Wrap up with conclusion and takeaways from the Starting from Scratch lessons.", :length => 0, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_starting_from_scratch_conclusion.m4v"},
	
	{:tutorial_id => (@tutorial_id+1), :title => "Intro", :description => "Overview of Excel's Worksheet and discussion on topics covered in the related episodes.", :length => 1, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_worksheets_intro.m4v"},
	{:tutorial_id => (@tutorial_id+1), :title => "Creating a Worksheet", :description => "Tutorial covers creating a new worksheet in Excel and related topics.", :length => 1, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_worksheets_creating_a_worksheet.m4v"},
	{:tutorial_id => (@tutorial_id+1), :title => "Entering Data", :description => "Learn various techniques for entering data in Excel.", :length => 2, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_worksheets_entering_data.m4v"},
	{:tutorial_id => (@tutorial_id+1), :title => "Selecting Data", :description => "Instruction on how to select cells and ranges of cells in Excel.", :length => 2, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_worksheets_selecting_data.m4v"},
	{:tutorial_id => (@tutorial_id+1), :title => "Copying and Pasting", :description => "More in depth overview of Excel's copy and paste special functionality.", :length => 2, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_worksheets_copy_and_paste_special.m4v"},
	{:tutorial_id => (@tutorial_id+1), :title => "Manipulating Data", :description => "Screencast covers techniques for modifying data in Excel.", :length => 2, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_worksheets_manipulating_data.m4v"},
	{:tutorial_id => (@tutorial_id+1), :title => "Rows and Columns", :description => "More in depth overview of Excel's rows and columns structure.", :length => 3, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_worksheets_rows_and_columns.m4v"},
	{:tutorial_id => (@tutorial_id+1), :title => "Grouping and Hiding", :description => "Learn how to group and hide rows and columns in Excel.", :length => 3, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_worksheets_grouping_and_hiding.m4v"},
	{:tutorial_id => (@tutorial_id+1), :title => "Conclusion", :description => "Final thoughts on worksheets for the introductory series.", :length => 3, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_worksheets_conclusion.m4v"},

	{:tutorial_id => (@tutorial_id+2), :title => "Overview and Uses", :description => "Introduction to formulas and functions in Excel with examples of common uses.", :length => 2, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_formulas_intro.m4v"},
	{:tutorial_id => (@tutorial_id+2), :title => "Manual Calculations", :description => "Learn the fundamentals of executing an Excel formula by first learning manual calculations.", :length => 2, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_formulas_manual_calculations.m4v"},
	{:tutorial_id => (@tutorial_id+2), :title => "Functions", :description => "First look at Excel's built in functions including explanation on setting up functions in Excel.", :length => 4, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_formulas_intro_to_functions.m4v"},
	{:tutorial_id => (@tutorial_id+2), :title => "IF Statements", :description => "Preview to IF statements in Excel, which is a powerful function used often.", :length => 3, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_formulas_if_statement.m4v"},
	{:tutorial_id => (@tutorial_id+2), :title => "Conclusion", :description => "Concluding thoughts on Excel's formulas and functions.", :length => 2, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_formulas_if_statement.m4v"},

	{:tutorial_id => (@tutorial_id+3), :title => "Intro", :description => "Overview of formatting in Excel.", :length => 1, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_formatting_intro.m4v"},
	{:tutorial_id => (@tutorial_id+3), :title => "Formatting Cells", :description => "The first part of learning how to format in Excel is mastering cell formats.", :length => 3, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_formatting_formatting_cells.m4v"},
	{:tutorial_id => (@tutorial_id+3), :title => "Formatting Text", :description => "Introduction to number formats and font formatting options.", :length => 4, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_formatting_formatting_text.m4v"},
	{:tutorial_id => (@tutorial_id+3), :title => "Alignment", :description => "Learn various techniques for aligning elements in Excel.", :length => 3, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_formatting_alignment.m4v"},
	{:tutorial_id => (@tutorial_id+3), :title => "Formatting Tips", :description => "Several tricks everyone should be using in Excel to save time with formatting.", :length => 2, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_formatting_tips_and_tricks.m4v"},
	{:tutorial_id => (@tutorial_id+3), :title => "Conclusion", :description => "Takeaways from this introduction to formatting in Excel.", :length => 1, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_formatting_conclusion.m4v"},

	{:tutorial_id => (@tutorial_id+4), :title => "Chart Types", :description => "Overview of chart types offered in Excel.", :length => 2, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_charts_intro.m4v"},
	{:tutorial_id => (@tutorial_id+4), :title => "Column Chart", :description => "Step-by-step tutorial on building a column chart with example data.", :length => 9, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_charts_column_chart.m4v"},
	{:tutorial_id => (@tutorial_id+4), :title => "Pie Chart", :description => "Watch as Pat creates a pie chart with sample data from scratch.", :length => 6, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_charts_pie_chart.m4v"},
	{:tutorial_id => (@tutorial_id+4), :title => "Line Chart", :description => "Tutorial on creating a line chart in Excel.", :length => 4, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_charts_line_chart.m4v"},
	{:tutorial_id => (@tutorial_id+4), :title => "Sparklines", :description => "See how to creat column chart sparklines and line chart sparklines easily.", :length => 2, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_charts_sparklines.m4v"},
	{:tutorial_id => (@tutorial_id+4), :title => "Conclusion", :description => "Takeaway from our introduction to charts lessons.", :length => 1, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_charts_conclusion.m4v"},

	{:tutorial_id => (@tutorial_id+5), :title => "Intro", :description => "Overview of sorting and filtering in Excel.", :length => 0, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_sorting_and_filtering_intro.m4v"},
	{:tutorial_id => (@tutorial_id+5), :title => "Sorting", :description => "Various data sorts are performed on a sample table.", :length => 5, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_sorting_and_filtering_sorting.m4v"},
	{:tutorial_id => (@tutorial_id+5), :title => "Filtering", :description => "Example data table is filtered using Excel's auto filters.", :length => 3, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_sorting_and_filtering_filtering.m4v"},
	{:tutorial_id => (@tutorial_id+5), :title => "VLOOKUP", :description => "Use the VLOOKUP function to reference data in other tables based on a matched value.", :length => 3, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_sorting_and_filtering_vlookup.m4v"},
	{:tutorial_id => (@tutorial_id+5), :title => "Conclusion", :description => "Use the VLOOKUP function to reference data in other tables based on a matched value.", :length => 1, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_sorting_and_filtering_conclusion.m4v"},

	{:tutorial_id => (@tutorial_id+6), :title => "Uses", :description => "When to use a pivot table and why they can be helpful.", :length => 1, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_pivot_table_intro.m4v"},
	{:tutorial_id => (@tutorial_id+6), :title => "Creating a Pivot Table", :description => "How to select data and create a pivot table.", :length => 4, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_pivot_table_creating_a_pivot_table.m4v"},
	{:tutorial_id => (@tutorial_id+6), :title => "Rearranging", :description => "Overview on how to quickly modify the layout of a pivot table.", :length => 2, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_pivot_tables_rearraning_pivot_tables.m4v"},
	{:tutorial_id => (@tutorial_id+6), :title => "Formatting", :description => "Demonstration showing how to format a pivot table.", :length => 2, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_pivot_tables_formatting_pivot_tables.m4v"},
	{:tutorial_id => (@tutorial_id+6), :title => "Sorting and Filtering", :description => "Covers sorting inside a pivot table as well as filtering with the Slicer.", :length => 3, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_pivot_tables_sorting_and_filtering_pivot_tables.m4v"},
	{:tutorial_id => (@tutorial_id+6), :title => "Conclusions", :description => "Concluding thoughts on the introductory pivot table lessons.", :length => 1, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_pivot_tables_conclusion.m4v"},

	{:tutorial_id => (@tutorial_id+7), :title => "Intro and Print Preview", :description => "Learn the shortcut for quickly previewing an excel document.", :length => 2, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_printing_intro_and print_preview.m4v"},
	{:tutorial_id => (@tutorial_id+7), :title => "Page Layout and Setup", :description => "Walk through sections of the page setup.", :length => 1, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_printing_page_layout.m4v"},
	{:tutorial_id => (@tutorial_id+7), :title => "Headers and Footers", :description => "See how to modify the header and footer.", :length => 2, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_printing_headers_and_footers.m4v"},
	{:tutorial_id => (@tutorial_id+7), :title => "Page Breaks", :description => "Watch a demonstration on inserting and removing page breaks.", :length => 1, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_printing_page_breaks.m4v"},
	{:tutorial_id => (@tutorial_id+7), :title => "Printing Selected Areas", :description => "How to print selected cell ranges and areas of a spreadsheet and a guide on repeating rows as headers.", :length => 2, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_printing_printing_selected_area.m4v"},
	{:tutorial_id => (@tutorial_id+7), :title => "Conclusion", :description => "Use a single row as the column header on multiple pages by repeating it.", :length => 1, :topic_path => "http://s3.amazonaws.com/officescholar/intro_to_excel_printing_conclusion.m4v"}
]

blank_quizzes = [
	{:tutorial_id => (@tutorial_id), :title => "Level I - Getting Started", :description => "You need to be able to open a file, add a worksheet, modify a worksheet name, use save, open and close as well as copy and paste.", :url => 'http://s3.amazonaws.com/officescholar/starting_from_scratch_quiz.xlsx'},
	{:tutorial_id => (@tutorial_id+1), :title => "Level I - Worksheets", :description => "In this Skill Assessment, we will copy and enter data as well as modify the structure of a worksheet by adding rows and columns.", :url => 'http://s3.amazonaws.com/officescholar/worksheets_quiz.xlsx'}
	# {:tutorial_id => 3, :title => "Intro to Formulas", :description => "First glimpse into using Excel as a powerful calculator and analysis tool. We begin with manually operations and end with built-in functions.", :url => 'http://s3.amazonaws.com/officescholar/intro_to_excel_3_intro_to_formulas.xlsx'},
	# {:tutorial_id => 4, :title => "Intro to Formatting", :description => "See how to customize the look and feel of your Excel worksheets.", :url => 'http://s3.amazonaws.com/officescholar/intro_to_excel_4_intro_to_formatting.xlsx'},
	# {:tutorial_id => 5, :title => "Charts", :description => "First look into charts gives basic overview of various chart types available in Excel as well specific instructional walk-throughs building column, pie, line and sparkline charts from scratch.", :url => 'http://s3.amazonaws.com/officescholar/intro_to_excel_5_charts.xlsx'},
	# {:tutorial_id => 6, :title => "Sorting and Filtering", :description => "Both sorting and filtering are demonstrated on example data tables, along with multiple conditions and the VLOOKUP function for referencing data in other locations based on a matched value.",:url => 'http://s3.amazonaws.com/officescholar/intro_to_excel_6_sorting_and_filtering.xlsx'},
	# {:tutorial_id => 7, :title => "Pivot Tables", :description => "Using data set from the 2012-2013 NFL Football season, see how to create, modify, format and sort a pivot table.  Also cover Pivot Table filters using Excel 2010's new Slicer feature for a more visual filter interface.", :url => 'http://s3.amazonaws.com/officescholar/intro_to_excel_7_pivot_tables.xlsx'},
	# {:tutorial_id => 8, :title => "Printing", :description => "Walk through printing a document in Excel including overviews on print preview, headers and footers, print areas and repeating a single row as a column heading for multiple pages.", :url => 'http://s3.amazonaws.com/officescholar/intro_to_excel_8_printing.xlsx'}

]

Package.create packages
Topic.create topics
BlankQuiz.create blank_quizzes