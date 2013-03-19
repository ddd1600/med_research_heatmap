class Spreadsheet < ActiveRecord::Base
  attr_accessible :name, :x_var_name, :y_var_name, :source
  serialize :source
  has_many :data_rows, dependent: :destroy
end
