json.array!(@assignments) do |assignment|
  json.extract! assignment, :id, :employee_id, :customer_id, :duration, :start_at, :end_at, :status, :signed_at
  json.url assignment_url(assignment, format: :json)
end
