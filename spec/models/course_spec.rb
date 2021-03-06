require 'rails_helper'

RSpec.describe Course, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:students).through(:student_courses)}
  end
  describe 'methods' do
    it "#total_students" do
      @harry = Student.create(name: "Harry Potter", age: 14 , house:"Griffindor")
      @hermoine = Student.create(name: "Hermoine Grainger", age: 14 , house:"Griffindor")
      @ron = Student.create(name: "Ron Weasley", age: 13 , house:"Griffindor")
      @malfoy = Student.create(name: "Lucious Malfoy", age: 14 , house:"Slytherin")
      @mertyl = Student.create(name: "Moaning Mertyl", age: 15 , house:"Huffelpuff")

      @dark_arts = Course.create(name: "Dark Arts")
      @spells = Course.create(name: "Spells")
      @biology = Course.create(name: "Biology")

      StudentCourse.create(course_id: @dark_arts.id, student_id: @harry.id)
      StudentCourse.create(course_id: @dark_arts.id, student_id: @ron.id)
      StudentCourse.create(course_id: @dark_arts.id, student_id: @hermoine.id)
      StudentCourse.create(course_id: @dark_arts.id, student_id: @malfoy.id)
      StudentCourse.create(course_id: @biology.id, student_id: @harry.id)
      StudentCourse.create(course_id: @biology.id, student_id: @ron.id)
      StudentCourse.create(course_id: @biology.id, student_id: @mertyl.id)
      StudentCourse.create(course_id: @spells.id, student_id: @ron.id)
      StudentCourse.create(course_id: @spells.id, student_id: @malfoy.id)
      StudentCourse.create(course_id: @spells.id, student_id: @hermoine.id)

      expect(@biology.total_students).to eq(3)
      expect(@dark_arts.total_students).to eq(4)
    end
    it ".alphabetical" do
      @harry = Student.create(name: "Harry Potter", age: 14 , house:"Griffindor")
      @hermoine = Student.create(name: "Hermoine Grainger", age: 14 , house:"Griffindor")
      @ron = Student.create(name: "Ron Weasley", age: 13 , house:"Griffindor")
      @malfoy = Student.create(name: "Lucious Malfoy", age: 14 , house:"Slytherin")
      @mertyl = Student.create(name: "Moaning Mertyl", age: 15 , house:"Huffelpuff")

      @dark_arts = Course.create(name: "Dark Arts")
      @spells = Course.create(name: "Spells")
      @biology = Course.create(name: "Biology")

      StudentCourse.create(course_id: @dark_arts.id, student_id: @harry.id)
      StudentCourse.create(course_id: @dark_arts.id, student_id: @ron.id)
      StudentCourse.create(course_id: @dark_arts.id, student_id: @hermoine.id)
      StudentCourse.create(course_id: @dark_arts.id, student_id: @malfoy.id)
      StudentCourse.create(course_id: @biology.id, student_id: @harry.id)
      StudentCourse.create(course_id: @biology.id, student_id: @ron.id)
      StudentCourse.create(course_id: @biology.id, student_id: @mertyl.id)
      StudentCourse.create(course_id: @spells.id, student_id: @ron.id)
      StudentCourse.create(course_id: @spells.id, student_id: @malfoy.id)
      StudentCourse.create(course_id: @spells.id, student_id: @hermoine.id)
      course = Course.all
      expect(course.alphabetical).to eq([@biology, @dark_arts, @spells])
    end
  end

end
