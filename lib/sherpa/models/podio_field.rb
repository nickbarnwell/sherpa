class Sherpa::PodioField
  attr_accessor :field

  def initialize(type, external_id, *args)
    @field = { external_id.to_sym => self.class.send(*TYPES[type].concat(args)) }
  end

  def create(type, external_id, *args)
    initialize(type, external_id, *args
  end

  class << self
    def single_value(val)
      {value: val}
    end

    def double_value(k1, k2, v1, v2)
      {k1.to_sym => v1, k2.to_sym => v2}
    end
  end

  #TODO: Make this not a find and replace hack
  TYPES = {
    title:    :single_value,
	  text:     :single_value,
	  number:   :single_value,
	  state:    :single_value,
	  image:    :single_value,
	  app:      :single_value,
	  member:   :single_value,
	  contact:  :single_value,
	  progress: :single_value,
	  location: :single_value,
	  video:    :single_value,
	  duration: :single_value,
	  question: :single_value,
    money:    [:double_value, :value, :currency],
    embed:    [:double_value, :embed, :file],
    date:     [:start, :end]
    
  }
end
