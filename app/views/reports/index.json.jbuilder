json.array!(@reports) do |report|
  json.extract! report, :id, :url, :pass, :fail, :error, :note, :plan_id
  json.url report_url(report, format: :json)
end
