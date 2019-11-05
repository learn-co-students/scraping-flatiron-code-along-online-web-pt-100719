class Course
  attr_accessor :title, :schedule, :description
  @@all = []
  def initialize(title)
    @title = title
    @@all << self
  end
end

