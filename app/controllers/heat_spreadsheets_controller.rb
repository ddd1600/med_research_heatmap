class HeatSpreadsheetsController < ApplicationController
  
  def heatmap
    ChartHelper.dump_png(HeatSpreadsheet.find(params[:id]))
    redirect_to "/heatmap.png"
  end
  
  def index
    @heat_spreadsheets = HeatSpreadsheet.all
  end

  def new
  end
  
  def create
    csv_source = File.open(params[:file].tempfile).read
    h = HeatSpreadsheet.new
    h.source = csv_source
    h.name = params[:name]
    h.save
    redirect_to heat_spreadsheets_path, :notice => "Spreadsheet uploaded!"
  end

  def destroy
    HeatSpreadsheet.find(params[:id]).destroy
    redirect_to heat_spreadsheets_path, :notice => "Spreadsheet destroyed."
  end

  def show
    @heat_spreadsheet = HeatSpreadsheet.find(params[:id])
    respond_to do |format|
      format.html
      format.csv { render :text => @heat_spreadsheet.source }
    end
  end
end
