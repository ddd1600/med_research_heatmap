class HeatSpreadsheet < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name, :source
  serialize :source
end
