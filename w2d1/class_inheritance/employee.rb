class Employee
  attr_reader :name, :salary, :title
  attr_accessor :boss

  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    self.salary * multiplier
  end

  def boss=(boss)
    @boss = boss
    boss.add_employee(self) unless boss.nil?
    boss
  end

end


class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss = nil)
    super(name, salary, title, boss)
    @employees = []
  end

  def bonus(multiplier)
    self.total_salary * multiplier
  end

  def total_salary
    total_salary = 0
    self.employees.each do |employee|
      if employee.is_a?(Manager)
        total_salary += employee.salary + employee.total_salary
      else
        total_salary += employee.salary
      end
    end

    total_salary
  end

  def add_employee(subordinate)
    employees << subordinate
    subordinate
  end

end
