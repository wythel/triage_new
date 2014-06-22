json.array!(@plans) do |plan|
  json.extract! plan, :id, :title, :owner
  json.url plan_url(plan, format: :json)
end
