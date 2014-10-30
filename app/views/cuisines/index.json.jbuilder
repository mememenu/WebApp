json.array!(@cuisines) do |cuisine|
  json.extract! cuisine, :id, :type
  json.url cuisine_url(cuisine, format: :json)
end
