class Test < ActiveRecord::Base
  belongs_to :user
  attr_accessible :date, :name, :notes
end
