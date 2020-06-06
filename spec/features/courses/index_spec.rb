require 'rails_helper'

RSpec.describe "courses index page", type: :feature do
    it "can see all courses and their student count" do
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

      visit "/courses"
      within ".course-#{@dark_arts.id}" do
        expect(page).to have_content(@dark_arts.name)
        expect(page).to have_content("Dark Arts: 4")
      end
      within ".course-#{@biology.id}" do
        expect(page).to have_content(@biology.name)
        expect(page).to have_content("Biology: 3")
      end
    end
    it "courses in alphabetical order and enrolled students in alphabetical" do
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

      visit "/courses"
      expect(@biology.name).to appear_before(@dark_arts.name)
      expect(@dark_arts.name).to appear_before(@spells.name)

      within ".course-#{@dark_arts.id}" do
        expect(@harry.name).to appear_before(@hermoine.name)
        expect(@malfoy.name).to appear_before(@ron.name)
      end
    end
end
