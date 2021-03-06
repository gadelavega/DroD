class Instrument < ActiveRecord::Base
  ARBITRARY_WINDOW = 50

  attr_accessible :desc, :name, :specs
  #relations
  belongs_to :group
  belongs_to :location
  has_many :fields
  has_many :surveys , :through => :fields
  has_many :survey_specs

 def timeWindow(from,to)
    value = (to - from).to_i.days
    case
    when value >= ARBITRARY_WINDOW.years
      "%Y"
    when value >= ARBITRARY_WINDOW.months
      "%m%Y"
    when value >= ARBITRARY_WINDOW.weeks
      "%W%Y"
    when value >= ARBITRARY_WINDOW.days
      "%j%Y"
    when value >= ARBITRARY_WINDOW.hours
      "%H%j%Y"
    when value >= ARBITRARY_WINDOW.minute
      "%M%H%j%Y"
    end
  end


end
