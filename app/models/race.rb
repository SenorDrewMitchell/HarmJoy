class Race < ActiveRecord::Base
  has_many :race_days
  
  belongs_to :start_day, class_name: 'RaceDay'
  belongs_to :end_day, class_name: 'RaceDay'

end
