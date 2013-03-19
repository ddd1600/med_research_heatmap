class ChartHelper
  
  def self.sample_chart
    ary_of_arys = [["Anti-Inflammatory A P1", "24", "50", "150", "58", "Stable"], ["Anti-Inflammatory A P2", "24", "59", "200", "60", "Stable"], ["Anti-Inflammatory A P3", "24", "52", "250", "63", "Critical"], ["Anti-Inflammatory A P1", "72", "71", "150", "58", "Stable"], ["Anti-Inflammatory A P2", "72", "105", "200", "60", "Stable"], ["Anti-Inflammatory A P3", "72", "97", "250", "63", "Critical"], ["Anti-Inflammatory B P1", "24", "30", "150", "58", "Stable"], ["Anti-Inflammatory B P2", "24", "27", "200", "60", "Stable"], ["Anti-Inflammatory B P3", "24", "40", "250", "63", "Critical"], ["Anti-Inflammatory B P1", "72", "87", "150", "58", "Stable"], ["Anti-Inflammatory B P2", "72", "26", "200", "60", "Stable"], ["Anti-Inflammatory B P3", "72", "33", "250", "63", "Critical"], ["Pro-Inflammatory P1", "24", "47", "150", "58", "Stable"], ["Pro-Inflammatory P2", "24", "56", "200", "60", "Stable"], ["Pro-Inflammatory P3", "24", "67", "250", "63", "Critical"], ["Pro-Inflammatory P1", "72", "15", "150", "58", "Stable"], ["Pro-Inflammatory P2", "72", "15", "200", "60", "Stable"], ["Pro-Inflammatory P3", "72", "35", "250", "63", "Critical"]]
    headers = ["Patient", "Hours After Surgery", "Concentration", "Weight", "Height"]
    molecules = ary_of_arys.map {|t| t[0]}.uniq
    dt = GoogleVisualr::DataTable.new
    dt.new_column("string", "Patient")
    dt.new_column("date", "Hours After Surgery")
    dt.new_column("number", "Concentration")
    dt.new_column("number", "Weight")
    dt.new_column("number", "Height")
    dt.new_column("string", "Condition")
    ary_of_arys.map! { |t| [t[0], ChartHelper.to_date(t[1]), t[2].to_f, t[3].to_f, t[4].to_f, t[5]] }
    dt.add_rows(ary_of_arys)
    dt
  end
  
  def self.get_dt_for_spreadsheet(ss_id)
    s = Spreadsheet.find(ss_id)
    molecules = s.data_rows.map(&:name).uniq
    dt = GoogleVisualr::DataTable.new
    dt.new_column("string", "Molecule")
    dt.new_column("date", s.x_var_name)
    dt.new_column("number", s.y_var_name)
    dt.new_column("number", s.z_var_name) #unless s.z_var_name.nil?
    dt.new_column("number", s.a_var_name) #unless s.a_var_name.nil?
    dt.new_column("string", s.b_var_name) #unless s.b_var_name.nil?
    dt.new_column("string", s.c_var_name) #unless s.c_var_name.nil?
    ary_of_arys = s.data_rows.map { |m| [m.name, ChartHelper.to_date(m.x_var), m.y_var, m.z_var, m.a_var, m.b_var, m.c_var] }
    dt.add_rows(ary_of_arys)
    dt
  end
  
  def self.get_opts
    state = {"yZoomedDataMax" => 105,"orderedByY" => false,"iconKeySettings" => [],"time" => "1970","showTrails" => true,"yAxisOption" => "2","yLambda" => 1,"playDuration" => 15000,"xZoomedDataMin" => 0,"colorOption" => "2","yZoomedIn" => false,"sizeOption" => "_UNISIZE","xAxisOption" => "_TIME","xLambda" => 1,"xZoomedIn" => false,"dimensions" => {"iconDimensions" => ["dim0"]},"xZoomedDataMax" => 172800000,"iconType" => "BUBBLE","duration" => {"timeUnit" => "D","multiplier" => 1},"orderedByX" => false,"uniColorForNonSelected" => false,"yZoomedDataMin" => 15,"nonSelectedAlpha" => 0.4}.to_json
    { :width => 800, :height => 640, :state => state }
  end
  
  def self.to_date(hours_after)
    day = hours_after.to_f / 24
    Date.new(1970, 1, day)
  end
end
