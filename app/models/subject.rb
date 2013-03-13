class Subject < ActiveRecord::Base
  belongs_to :reading
  attr_accessible :name, :notes
end
