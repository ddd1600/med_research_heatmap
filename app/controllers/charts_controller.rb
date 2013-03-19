class ChartsController < ApplicationController
  def heat_map
    spreadsheet_id = params[:id]
    dt = ChartHelper.get_dt_for_spreadsheet(spreadsheet_id)
    opts = ChartHelper.get_opts
    @chart = GoogleVisualr::Interactive::MotionChart.new(dt, opts)
  end
  
  def sample_heat_map
    dt = ChartHelper.sample_chart
    opts = ChartHelper.get_opts
    @chart = GoogleVisualr::Interactive::MotionChart.new(dt, opts)
  end
end
