require_relative "employee.rb"
require "byebug"
class Manager < Employee 
  def initialize(employees, name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = employees 
  end 

  def bonus(multiplier)
    total = 0
    @employees.each do |employee|
      # debugger
      if employee === Manager 
        total += employee.bonus(multiplier)
      end
      total += employee.salary 
    end 
    total * multiplier
  end 
  
end 

shawna = Employee.new('shawna', 'TA', 12000, "darren")

david = Employee.new('david', 'TA', 10000, "darren")

darren = Manager.new([shawna, david], 'darren', 'TA Manager', 78000, "ned")

ned = Manager.new([darren],'ned', 'Founder', 1000000, nil)




p ned.bonus(5) 
p darren.bonus(4)
p david.bonus(3)
p shawna.bonus(3)