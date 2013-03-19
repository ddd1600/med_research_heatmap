class DataRow < ActiveRecord::Base
  attr_accessible :name, :x_var, :y_var
  belongs_to :spreadsheet, dependent: :destroy
end
