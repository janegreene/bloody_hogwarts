require 'rails_helper'

RSpec.describe "students show page", type: :feature do
    it "can see list of students courses" do
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

      visit "/students/#{@harry.id}"
        expect(page).to have_content("Dark Arts")
        expect(page).not_to have_content("Spells")
        expect(page).to have_content("Biology")
    end
end
