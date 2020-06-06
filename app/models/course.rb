class Course <ApplicationRecord
  validates_presence_of :name
has_many :student_courses
has_many :students, through: :student_courses

  def total_students
    self.students.count
  end

  def self.alphabetical
    order(:name)
  end
end
