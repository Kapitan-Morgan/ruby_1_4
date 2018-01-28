class Employee

	attr_reader :name

	def name_set(name) 
		raise "Name can't be blank!" if name == ""
    	@name = name
  end

  def initialize(name = "Anonymous") 
		self.name_set name
	end

	def print_name
  	puts "Name: #{name}"
  end

end

class SalariedEmployee < Employee

	attr_reader :salary

	def salary_set(salary) 
		raise "A salary of #{salary} isn't valid!" if salary < 0
			@salary = salary 
	end


	def initialize(name = "Anonymous", salary = 0.0) 
		super(name)
		self.salary_set salary
	end

	def print_pay_stub
		print_name
		puts format("Pay This Period: $%.2f", (salary / 365.0) * 14)
		#puts "Name: #{@name}"
		#pay_for_period = (@salary / 365.0) * 14
		#formatted_pay = format("%.2f", pay_for_period)
		#puts "Pay This Period: $#{formatted_pay}"
	end

end

class HourlyEmployee < Employee

	def self.security_guard(name) 
		HourlyEmployee.new(name, 19.25, 30)
	end

	def self.cashier(name)
		HourlyEmployee.new(name, 12.75, 25) 
	end

	def self.janitor(name) 
		HourlyEmployee.new(name, 10.50, 20)
	end

	attr_reader :hourly_wage, :hours_per_week

	def hourly_wage_set(hourly_wage)
		raise "A hourly_wage of #{hourly_wage} isn't valid!" if hourly_wage < 0
		@hourly_wage = hourly_wage
	end

	def hours_per_week_set(hours_per_week)
		raise "A hours_per_week of #{hours_per_week} isn't valid!" if hours_per_week < 0
		@hours_per_week = hours_per_week
	end

	def initialize(name = "Anonymous", hourly_wage = 0.0, hours_per_week = 0.0) 
		super(name)
		self.hourly_wage_set hourly_wage
		self.hours_per_week_set hours_per_week
 	end

	def print_pay_stub
		print_name
		pay_for_period = hourly_wage * hours_per_week * 2 
		formatted_pay = format("$%.2f", pay_for_period) 
		puts "Pay This Period: #{formatted_pay}"
	end 

end

test = SalariedEmployee.new('Jane', 50000).print_pay_stub
#test.name_set "jane"
#test.salary_set 30000
#test.print_pay_stub

#Создаем новый экземпляр класса с паттерном класса

angela = HourlyEmployee.security_guard('Angela Matthews').print_pay_stub
ivan = HourlyEmployee.cashier('Ivan Stokes').print_pay_stub

hourly_employee = HourlyEmployee.new('John Smith', 14.97, 30).print_pay_stub
#hourly_employee.name_set "John Smith" 
#hourly_employee.hourly_wage_set 14.97 
#hourly_employee.hours_per_week_set 30 
#hourly_employee.print_pay_stub

#amy = Employee.new('Emilia Clarke', 50000).print_pay_stub
#anonim = Employee.new('Ivanov', 45000).print_pay_stub
#puts amy.name

=begin
puts format("%12s | %s", "Product", "Cost in Cents")
puts "-" * 30
puts format("%12s | %2i", "Stamps", 50) 
puts format("%12s | %2i", "Paper Clips", 5) 
puts format("%12s | %2i", "Tape", 99)
#puts amy.class.superclass

def test_format(format_string)
	print "Testing '#{format_string}': " 
	puts format(format_string, 12.3456)
end

test_format "%7.3f"
=end







