class AddExcelPathToTutorials < ActiveRecord::Migration
  def change
    add_column :tutorials, :excel_path, :string
  end
end
