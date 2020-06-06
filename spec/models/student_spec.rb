require 'rails_helper'

RSpec.describe Student, type: :model do

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :house}
  end

  describe 'relationships' do
    it {should have_many :student_courses}
    it {should have_many(:courses).through(:student_courses)}
  end
  describe 'methods' do
    it ".average_age" do
      @harry = Student.create(name: "Harry Potter", age: 14 , house:"Griffindor")
      @hermoine = Student.create(name: "Hermoine Grainger", age: 14 , house:"Griffindor")
      @ron = Student.create(name: "Ron Weasley", age: 13 , house:"Griffindor")
      @malfoy = Student.create(name: "Lucious Malfoy", age: 14 , house:"Slytherin")
      @mertyl = Student.create(name: "Moaning Mertyl", age: 15 , house:"Huffelpuff")
      student = Student.all
      expect(student.average_age).to eq(14)
    end
    it ".alphabetical" do
      @harry = Student.create(name: "Harry Potter", age: 14 , house:"Griffindor")
      @hermoine = Student.create(name: "Hermoine Grainger", age: 14 , house:"Griffindor")
      @ron = Student.create(name: "Ron Weasley", age: 13 , house:"Griffindor")
      @malfoy = Student.create(name: "Lucious Malfoy", age: 14 , house:"Slytherin")
      @mertyl = Student.create(name: "Moaning Mertyl", age: 15 , house:"Huffelpuff")
      student = Student.all
      expect(student.alphabetical.first).to eq(@harry)
      expect(student.alphabetical.last).to eq(@ron)
    end
  end
end
