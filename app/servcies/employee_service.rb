require 'net/http'

class EmployeeService
  def role(id)
    uri = URI("#{ENV['EMPLOYEES_API_SERVICE_URL']}/employees/#{id}")
    employee = JSON.parse(Net::HTTP.get(uri))
    employee && employee["role"]
  end
end
