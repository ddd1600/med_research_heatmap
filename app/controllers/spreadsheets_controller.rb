class SpreadsheetsController < ApplicationController
  def index
    @spreadsheets = Spreadsheet.all
  end
  
  def show
    @spreadsheet = Spreadsheet.find(params[:id])
  end
  
  def new
    unless current_user
      redirect_to new_sessions_path
    end
  end
  
  def destroy
    s = Spreadsheet.find(params[:id])
    s.destroy
    redirect_to spreadsheets_path
  end

  def create
    ary_of_arys = ImportHelper.csv_to_ary_of_arys(params[:file].tempfile)
    spreadsheet_id = ImportHelper.create_spreadsheet(params[:name], ary_of_arys, current_user.id)
    ImportHelper.create_data_rows(spreadsheet_id, ary_of_arys)
    redirect_to spreadsheets_path, :notice => "Spreadsheet uploaded!"
  end
end
