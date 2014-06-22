json.array!(@branches) do |branch|
  json.extract! branch, :id, :title
  json.url branch_url(branch, format: :json)
end
