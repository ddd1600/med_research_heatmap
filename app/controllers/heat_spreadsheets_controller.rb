class HeatSpreadsheetsController < ApplicationController
  def index
    @heat_spreadsheets = HeatSpreadsheet.all
  end

  def new
  end
  
  def create
    ary_of_arys = CSV.parse(params[:file].tempfile)
    h = HeatSpreadsheet.new
    h.source = ary_of_arys.to_json
    h.name = params[:name]
    h.save
    redirect_to heat_spreadsheets_path, :notice => "Spreadsheet uploaded!"
  end

  def destroy
    HeatSpreadsheet.find(params[:id]).destroy
    redirect_to heat_spreadsheets_path, :notice => "Spreadsheet destroyed."
  end

  def show
  end
end
