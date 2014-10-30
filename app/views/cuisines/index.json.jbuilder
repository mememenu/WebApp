json.array!(@cuisines) do |cuisine|
  json.extract! cuisine, :id, :genre
  json.url cuisine_url(cuisine, format: :json)
end
