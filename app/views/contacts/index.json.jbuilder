json.array!(@contacts) do |contact|
  json.extract! contact, :id, :first_name, :last_name, :favorite_restaurant, :email, :message
  json.url contact_url(contact, format: :json)
end
