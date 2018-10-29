class Recipe
  attr_reader :name, :description, :prep_time, :dificulty
  attr_accessor :status

  def initialize(args = {})
    @name = args[:name]
    @description = args[:description]
    @prep_time = args[:prep_time]
    @status = args[:status] || false
    @dificulty = args[:dificulty] || "no dificulty given"
  end
end
