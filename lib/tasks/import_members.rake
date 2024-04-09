namespace :import do
    desc "Import members from Excel file"
    task members: :environment do
      file_path = Rails.root.join("public", "seznam.xlsx")
      excel = Roo::Excelx.new(file_path)
      
      # Define a mapping between Excel column names and attributes in the Member model
      column_mapping = {
        "member_id" => :external_id,
        "title" => :title,
        "last_name" => :last_name,
        "first_name" => :first_name,
        "city" => :city,
        "email" => :email
      }
      
      # Iterate over each row in the Excel sheet
      (2..excel.last_row).each do |i|
        # Extract data from the current row based on the column mapping
        row = {}
        column_mapping.each do |excel_column, attribute|
          # Find the index of the current Excel column
          column_index = excel.sheet(0).row(1).index(excel_column)
          # If the column exists, add it to the row hash
          row[attribute] = excel.row(i)[column_index] if column_index
        end
        
        # Create a new Member record with the extracted data
        Member.create!(row)
      end
    end
  end
  