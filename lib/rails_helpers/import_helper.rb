class ImportHelper
  def self.csv_to_ary_of_arys(file)
    CSV.readlines(file)
  end
  
  def self.create_spreadsheet(name, ary_of_arys, current_user)
    s = Spreadsheet.new
    s.name = name
    5/0 if ary_of_arys[0][1] =~ /\d/
    p ary_of_arys
    s.x_var_name = ary_of_arys[0][1]
    s.y_var_name = ary_of_arys[0][2]
    s.z_var_name = ary_of_arys[0][3] || nil
    s.a_var_name = ary_of_arys[0][4] || nil
    s.b_var_name = ary_of_arys[0][5] || nil
    s.c_var_name = ary_of_arys[0][6] || nil
    s.user_id = current_user.id
    s.source = ary_of_arys
    s.save
    s.id
  end
  
  def self.create_data_rows(parent_id, ary_of_arys)
    ary_of_arys.shift #removing headers
    ary_of_arys.each do |row|
      d = DataRow.new
      d.spreadsheet_id = parent_id
      d.name = row[0]
      d.x_var = row[1]
      d.y_var = row[2]
      d.z_var = row[3] || nil
      d.a_var = row[4] || nil 
      d.b_var = row[5] || nil
      d.c_var = row[6] || nil
      d.save
    end
  end

end
