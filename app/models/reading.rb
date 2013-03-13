class Reading < ActiveRecord::Base
  belongs_to :test
  belongs_to :subject
  attr_accessible :drug_name, :notes, :result
end
