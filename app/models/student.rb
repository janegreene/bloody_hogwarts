class Student <ApplicationRecord
  validates_presence_of :name, :age, :house
  has_many :student_courses
  has_many :courses, through: :student_courses

  def self.average_age
    average(:age)
  end

  def self.alphabetical
    order(:name)
    # pluck(:name).join(", ")
  end
end
