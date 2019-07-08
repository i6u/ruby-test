# frozen_string_literal: true

# first ruby test
class Student
  attr_accessor :first_name, :last_name, :primary_phone_number

  def introduction
    puts "Hi, I'm #{first_name}!"
  end

  def favorite_number
    first_name
  end
end

frank = Student.new
frank.first_name = 'Max'
frank.introduction
puts frank.favorite_number
