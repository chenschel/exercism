class Garden
  GROWABLE = { 'R' => :radishes,
               'C' => :clover,
               'G' => :grass,
               'V' => :violets }.freeze

  STUDENTS = %i[alice bob charlie david eve fred ginny
                harriet ileana joseph kincaid larry].freeze

  attr_reader :row_one, :row_two, :students

  private

  def initialize(diagram, students = nil)
    @row_one, @row_two = diagram.split("\n")
    @students = students

    prepare_students
  end

  def grow_helper(range)
    (row_one[range] + row_two[range]).scan(/\w/).map { |abbr| GROWABLE[abbr] }
  end

  def prepare_students
    @students = students&.map(&:downcase)&.sort || STUDENTS

    students_hash = {}

    students.each_with_index do |student, index|
      students_hash[student] = (index * 2)..(index * 2 + 1)
    end

    students_hash.each do |method_name, range|
      define_singleton_method(method_name.to_s) do
        grow_helper(range)
      end
    end
  end
end
