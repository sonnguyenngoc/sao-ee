json.array!(@categories) do |category|
  json.extract! category, :id, :name, :level, :description
  json.url category_url(category, format: :json)
end
