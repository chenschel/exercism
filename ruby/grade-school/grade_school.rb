require 'ostruct'

class School
  def initialize
    @students = []
  end

  def students(grade)
    @students.group_by(&:grade)
             .map { |o_grade, o_students| o_students.map(&:name) if o_grade == grade }
             .flatten
             .compact
             .sort
  end

  def students_by_grade
    stud_hash = ->(o_grade, o_students) { { grade: o_grade, students: o_students.map(&:name).sort } }
    @students.group_by(&:grade)
             .map { |o_grade, o_students| stud_hash.call(o_grade, o_students) }
             .sort_by { |grade_hash| grade_hash[:grade] }
  end

  def add(name, grade)
    @students << OpenStruct.new(name: name, grade: grade)
  end
end
