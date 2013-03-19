class ChartHelper
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
    day = hours_after / 24
    Date.new(1970, 1, day)
  end
end
