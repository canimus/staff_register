json.array!(@employees) do |employee|
  json.extract! employee, :id, :name, :email, :mobile, :title, :role, :assigned, :active, :joined_planit_at
  json.url employee_url(employee, format: :json)
end
