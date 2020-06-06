require 'rails_helper'

RSpec.describe "students index page", type: :feature do
    it "can see all students and their information" do
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

      visit "/students"
      within ".student-#{@harry.id}" do
        expect(page).to have_content(@harry.name)
        expect(page).to have_content("Age: #{@harry.age}")
        expect(page).to have_content("House: #{@harry.house}")
      end
    end
    it "shows average age of students" do
      @harry = Student.create(name: "Harry Potter", age: 14 , house:"Griffindor")
      @hermoine = Student.create(name: "Hermoine Grainger", age: 14 , house:"Griffindor")
      @ron = Student.create(name: "Ron Weasley", age: 13 , house:"Griffindor")
      @malfoy = Student.create(name: "Lucious Malfoy", age: 14 , house:"Slytherin")
      @mertyl = Student.create(name: "Moaning Mertyl", age: 15 , house:"Huffelpuff")

      visit "/students"
      expect(page).to have_content("Average age: 14")
    end
    it "shows alphabetical order" do
      @harry = Student.create(name: "Harry Potter", age: 14 , house:"Griffindor")
      @hermoine = Student.create(name: "Hermoine Grainger", age: 14 , house:"Griffindor")
      @ron = Student.create(name: "Ron Weasley", age: 13 , house:"Griffindor")
      @malfoy = Student.create(name: "Lucious Malfoy", age: 14 , house:"Slytherin")
      @mertyl = Student.create(name: "Moaning Mertyl", age: 15 , house:"Huffelpuff")

      visit "/students"
      @harry.name.should appear_before(@hermoine.name)
      @hermoine.name.should appear_before(@malfoy.name)
      @mertyl.name.should appear_before(@ron.name)
    end
end
